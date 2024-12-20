import 'package:flutter/material.dart';
import 'package:my_trainings_app/services/constants.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return AppBar(
      title: Text(
        'Trainings',
        style: Theme.of(context).textTheme.headlineLarge?.apply(
            color: Colors.white,
            fontSizeDelta: -2,
            fontWeightDelta: 1
        ),
      ),
      centerTitle: false,
      backgroundColor: TrainingsColors.appHighlightColor,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
        )
      ],

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
