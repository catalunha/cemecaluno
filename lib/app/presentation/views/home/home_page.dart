import 'package:aluno/app/presentation/controllers/home/home_controller.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/routes.dart';
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  SizedBox(
                    width: 200,
                    child: cursoPago2(
                      name: 'nomeCurso01 (Pago)',
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
                      name: 'nomeCurso02 (Pago)',
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
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text('Outras cursos pra você'),
                    Expanded(
                      // flex: 3,
                      child: Container(
                        color: Colors.black,
                        child: ListView(children: [
                          cursoOferta(
                            name: 'nomeCurso03 (Oferta)',
                            imageCourse:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                            imageCoord:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                            imageProf:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                          ),
                          cursoOferta(
                            name: 'nomeCurso04 (Oferta)',
                            imageCourse:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                            imageCoord:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                            imageProf:
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Card cursoOferta(
      {required String name,
      required String imageCourse,
      required String imageCoord,
      required String imageProf}) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Incrições até: 10-06-2022 as 23:59',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    // const Text(
                    //   'É um curso bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Equipe:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tooltip(
                                  message: 'Coord.: nomeCoordenador(a)',
                                  child: Image.network(
                                    imageCoord,
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
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 15,
                          color: Colors.red,
                        ),
                        Column(
                          children: [
                            const Text('Dúvidas:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tooltip(
                                  message: 'Izaira. Organizadora',
                                  child: Image.network(
                                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/1ff7d0e5a37032c8fd882be43f8f2388_woman4.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () => AppLaunch.launch(
                                            'https://cemec.net.br'),
                                        child: const Icon(Icons.web)),
                                    InkWell(
                                        onTap: () => AppLaunch.launchWhatsApp(
                                            phone: '5533988053701',
                                            message: 'teste app cemec'),
                                        child: const Icon(Icons.whatsapp))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text('Modalidades de pagamento:'),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.payPix, arguments: 'pix');
                },
                child: Row(
                  children: const [
                    Icon(Icons.pix),
                    Text('PIX: R\$390,00 a vista')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.payPix, arguments: 'bankslip');
                },
                child: Row(
                  children: const [
                    Icon(Icons.sticky_note_2),
                    Text('Boleto: R\$ 295,00 a vista')
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  Get.toNamed(Routes.payPix, arguments: 'card');
                },
                child: Row(
                  children: const [
                    Icon(Icons.credit_card),
                    Text('Cartão: R\$110,00 em 3 parcelas')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card cursoPago(
      {required String name,
      required String imageCourse,
      required String imageCoord,
      required String imageProf}) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Equipe:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Tooltip(
                                      message: 'Coord.: nomeCoordenador(a)',
                                      child: Image.network(
                                        imageCoord,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
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
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Comunidade:'),
                            InkWell(
                              onTap: () =>
                                  AppLaunch.launch('https://discord.com'),
                              child: Image.network(
                                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/471cd767e375913b3cab8fc4d97f24be_comunidade.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Card cursoPago2(
      {required String name,
      required String imageCourse,
      required String imageCoord,
      required String imageProf}) {
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
          ClipRRect(
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => AppLaunch.launch('https://discord.com'),
                child: Image.network(
                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/471cd767e375913b3cab8fc4d97f24be_comunidade.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
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
            ],
          ),
        ],
      ),
    );
  }
}
