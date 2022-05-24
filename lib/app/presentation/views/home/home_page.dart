import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:aluno/app/presentation/views/home/part/course_icon.dart';
import 'package:aluno/app/presentation/views/home/part/course_sale.dart';
import 'package:aluno/app/presentation/views/home/part/popmenu_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aluno/app/presentation/controllers/home/home_controller.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/app_linear_progress_indicator.dart';
import 'package:aluno/app/routes.dart';

class HomePage extends StatefulWidget {
  final SplashController _splashController = Get.find();
  final HomeController _homeController = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: appBarTitle(),
        actions: [
          appBarActionCart(),
          appBarActionCourses(),
          // appBarActionUser(),
          PopMenuButtonPhotoUser(),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black12,
              width: double.infinity,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: cursoPago2(
                        name: 'nomeCurso01',
                        turma: '2022.3',
                        imageCourse:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                        imageCoord:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                        imageProf:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/4d25fa84c39f08ac1dc1af1f3ab4fe84_woman3.png',
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: cursoPago2(
                        name: 'nomeCurso02',
                        turma: '2021.9',
                        imageCourse:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                        imageCoord:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
                        imageProf:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/be018b06eab0a32da738b15672979fc0_woman5.png',
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: cursoPago2(
                        name: 'nomeCurso02',
                        turma: '2021.9',
                        imageCourse:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                        imageCoord:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
                        imageProf:
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/be018b06eab0a32da738b15672979fc0_woman5.png',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black38,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    color: Colors.black87,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Outros cursos pra você',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: Wrap(
                        children: [
                          SizedBox(
                            width: 350,
                            child: cursoOferta(
                              name: 'nomeCurso03',
                              turma: '2022.1',
                              imageCourse:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                              imageCoord:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                              imageProf:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: cursoOferta(
                              name: 'nomeCurso04',
                              turma: '2021.7',
                              imageCourse:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                              imageCoord:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                              imageProf:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: cursoOferta(
                              name: 'nomeCurso04',
                              turma: '2021.7',
                              imageCourse:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                              imageCoord:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                              imageProf:
                                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell appBarActionUser() {
    return InkWell(
      onTap: widget._homeController.logout,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/0b28345ecb39e2177d1746f80246ed70_woman2.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  IconButton appBarActionCourses() {
    return IconButton(
      onPressed: () {
        Get.toNamed(Routes.purchaseOrder);
      },
      icon: const Icon(Icons.list),
    );
  }

  IconButton appBarActionCart() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_cart_rounded,
        color: Colors.red,
      ),
    );
  }

  Widget appBarTitle() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem vinda(o),',
              style: TextStyle(fontSize: 12),
            ),
            Text(widget._splashController.userModel?.profile?.nameTag == null
                ? "Atualize seu perfil em 🤪."
                : widget._splashController.userModel!.profile!.nameTag!),
          ],
        ));
  }

  Card cursoOferta({
    required String name,
    required String turma,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseSale(
            imageCourse: imageCourse,
            imageCoord: imageCoord,
            imageProf: imageProf,
            name: name,
            turma: turma,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    color: Colors.green,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'INVESTIMENTO NO CURSO R\$ 100,00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const Text('Modalidades de pagamento:'),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.purchaseCart, arguments: 'pix');
                    },
                    child: const Icon(Icons.pix),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.purchaseCart, arguments: 'bankslip');
                    },
                    child: const Icon(Icons.sticky_note_2),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.purchaseCart, arguments: 'card');
                    },
                    child: const Icon(Icons.credit_card),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card cursoPago2({
    required String name,
    required String turma,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            turma,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.course);
              },
              child: CourseIcon(imageCourse: imageCourse)),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => AppLaunch.launch('https://discord.com'),
                child: const Icon(
                  Icons.discord,
                  size: 40,
                  color: Colors.black,
                ),
                // child: Image.network(
                //   'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/471cd767e375913b3cab8fc4d97f24be_comunidade.png',
                //   width: 40,
                //   height: 40,
                //   fit: BoxFit.cover,
                // ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: 'Coord.: nomeCoordenador(a)',
                    child: Image.network(
                      imageCoord,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Tooltip(
                message: 'Prof(a).: nomeProfessora',
                child: Image.network(
                  imageProf,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Tooltip(
                message: 'Prof(a).: nomeProfessora',
                child: Image.network(
                  imageProf,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const AppLinearPercentIndicator(percent: 0.213),
        ],
      ),
    );
  }
}
