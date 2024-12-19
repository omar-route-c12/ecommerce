import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_tab.dart';
import 'package:ecommerce/features/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce/features/profile/presentation/widgets/profile_tab.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const WishlistTab(),
    const ProfileTab(),
  ];
  final GetCategories _getCategories;

  HomeCubit(this._getCategories) : super(HomeInitialState()) {
    getCategories();
  }

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
    currentIndex = selectedIndex;
    emit(SelectedIndexChanged());
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(
        GetCategoriesSErrorState(failure.message),
      ),
      (categories) => emit(
        GetCategoriesSuccessState(categories),
      ),
    );
  }
}
