import 'package:course/configs/themes/app_icons.dart';
import 'package:course/configs/themes/ui_parameters.dart';
import 'package:course/screens/question/test_overview_screen.dart';
import 'package:course/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/custom_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key,
  this.title='',
  this.showAction=false,
  this.leading,
  this.titleWidget,
  this.onMenuActionTap,
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showAction;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobileScreenPadding,
          vertical: mobileScreenPadding,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget==null 
              ? Center(
                child: Text(
                  title,
                  style: appBarTS,
                ),)
              : Center(
                child: titleWidget), 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading??Transform.translate(offset: const Offset(-14, 0),
                  child: const BackButton(),
                  ),
                  if(showAction)
                    Transform.translate(offset: const Offset(10, 0),
                    child: AppCircleButton(
                      onTap: onMenuActionTap??()=>Get.toNamed(TestOverviewScreen.routeName),
                      child: const Icon(AppIcons.menu),
                      ),
                    )
                ],
              )
          ],
        ),
      ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
    double.maxFinite,
    80,
  );
}