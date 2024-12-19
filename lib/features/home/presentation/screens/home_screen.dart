import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCubit = serviceLocator.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          extendBody: false,
          body: homeCubit.tabs[homeCubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(15),
              topEnd: Radius.circular(15),
            ),
            child: SizedBox(
              height: MediaQuery
                  .sizeOf(context)
                  .height * 0.1,
              child: BottomNavigationBar(
                currentIndex: homeCubit.currentIndex,
                onTap: (value) => homeCubit.changeSelectedIndex(value),
                backgroundColor: ColorManager.primary,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorManager.primary,
                unselectedItemColor: ColorManager.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  CustomBottomNavBarItem(IconsAssets.home, 'Home'),
                  CustomBottomNavBarItem(IconsAssets.category, 'Categories'),
                  CustomBottomNavBarItem(IconsAssets.wishlist, 'WishList'),
                  CustomBottomNavBarItem(IconsAssets.profile, 'Profile'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String iconPath;
  final String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
    label: title,
    icon: ImageIcon(
      AssetImage(iconPath),
      color: ColorManager.white,
    ),
    activeIcon: CircleAvatar(
      radius: 12,
      backgroundColor: ColorManager.white,
      child: ImageIcon(
        AssetImage(iconPath),
        color: ColorManager.primary,
        size: 14,
      ),
    ),
  );
}
