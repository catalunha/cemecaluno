import 'package:aluno/app/presentation/views/home/part/organizer_perfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aluno/app/presentation/controllers/home/home_controller.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/linear_progress_indicator.dart';
import 'package:aluno/app/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: appBarTitle(),
        actions: [
          appBarActionCart(),
          appBarActionCourses(),
          appBarActionUser(),
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
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/1ff7d0e5a37032c8fd882be43f8f2388_woman4.png',
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
                            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/1ff7d0e5a37032c8fd882be43f8f2388_woman4.png',
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
      onTap: _homeController.logout,
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

  Column appBarTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Bem vinda,',
          style: TextStyle(fontSize: 12),
        ),
        Text('Ana'),
      ],
    );
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
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(0),
              ),
              child: Image.network(
                imageCourse,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
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
          const LinearPercentIndicator(percent: 0.213),
        ],
      ),
    );
  }
}

class CourseSale extends StatelessWidget {
  final String imageCourse;
  final String name;
  final String turma;
  final String imageCoord;
  final String imageProf;

  const CourseSale({
    Key? key,
    required this.imageCourse,
    required this.name,
    required this.turma,
    required this.imageCoord,
    required this.imageProf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CourseIcon(imageCourse: imageCourse),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                turma,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Incrições até: 10-06-2022 as 23:59',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Equipe:'),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CoordPerfil(imageCoord: imageCoord),
                          ProfsPerfil(imageProf: imageProf)
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dúvidas:'),
                      OrganizerPerfil(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProfsPerfil extends StatelessWidget {
  const ProfsPerfil({
    Key? key,
    required this.imageProf,
  }) : super(key: key);

  final String imageProf;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
          message: 'Prof(a).: nomeProfessora',
          child: Image.network(
            imageProf,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        Tooltip(
          message: 'Prof(a).: nomeProfessora',
          child: Image.network(
            imageProf,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class CoordPerfil extends StatelessWidget {
  const CoordPerfil({
    Key? key,
    required this.imageCoord,
  }) : super(key: key);

  final String imageCoord;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Coord.: nomeCoordenador(a)',
      child: Image.network(
        imageCoord,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CourseIcon extends StatelessWidget {
  const CourseIcon({
    Key? key,
    required this.imageCourse,
  }) : super(key: key);

  final String imageCourse;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(30),
        topLeft: Radius.circular(30),
        topRight: Radius.circular(0),
      ),
      child: Image.network(
        imageCourse,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
