import 'package:aluno/app/presentation/controllers/home/home_controller.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppbar(
          logout: () => _homeController.logout(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Bem vindo ao CEMEC - Alunos'),
              Text('O aplicativo para os alunos organizarem seus cursos'),
              Text('Esta em construção...'),
            ],
          ),
        ));
  }
}
