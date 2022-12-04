import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_bottom_nav_bar.dart';
import '../../global_widgets/main_drawer_widget.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: MainDrawerWidget(),
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          unselectedColor: Colors.black,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              label: "Home".tr,
            ),
            CustomBottomNavigationItem(
              icon: FontAwesomeIcons.calendar,
              label: "Diary".tr,
            ),
            CustomBottomNavigationItem(
              icon:FontAwesomeIcons.scaleBalanced,
              label: "Buy/Sell".tr,
            ),
            CustomBottomNavigationItem(
              icon: FontAwesomeIcons.film,
              label: "Videos".tr,
            ),
            CustomBottomNavigationItem(
              icon: FontAwesomeIcons.globe,
              label: "News".tr,
            ),
          ],
        ),
      );
    });
  }
}
