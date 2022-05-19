import 'package:aluno/app/presentation/views/utils/app_assets.dart';
import 'package:flutter/material.dart';

class AppAppbar extends AppBar {
  AppAppbar({
    Key? key,
    // double elevation = 2,
    Function()? logout,
  }) : super(
            key: key,
            backgroundColor: Colors.white,
            // elevation: 10,
            centerTitle: true,
            title: Image.asset(
              AppAssets.logo,
              width: 170,
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            actions: [
              logout != null
                  ? IconButton(
                      onPressed: logout, icon: const Icon(Icons.exit_to_app))
                  : const SizedBox()
            ]);
}
