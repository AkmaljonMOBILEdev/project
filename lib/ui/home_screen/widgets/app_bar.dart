import 'package:e_commerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCE4EC), // Misty Rose
              Color(0xFFE1BEE7), // Lavender Purple
              // Color(0xFFB3E5FC), // Light Blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: (){

        },
        icon: SvgPicture.asset(AppIcons.search),
      ),
      actions: [
        IconButton(onPressed: (){},
            icon: SvgPicture.asset(AppIcons.menu))
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => SizedBox();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
