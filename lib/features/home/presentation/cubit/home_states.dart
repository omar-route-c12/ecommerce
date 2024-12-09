import 'package:ecommerce/features/home/domain/entities/category.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class GetCategoriesSuccessState extends HomeState {
  final List<Category> categories;

  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesSErrorState extends HomeState {
  final String message;

  GetCategoriesSErrorState(this.message);
}

class GetCategoriesLoadingState extends HomeState {}
