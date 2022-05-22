import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/linear_progress_indicator.dart';
import 'package:flutter/material.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({Key? key}) : super(key: key);

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Seus cursos'),
      ),
      body: ListView(
        children: [
          cursoPagtoPix(
            name: 'nomeCurso07',
            turma: '2022',
            imageCourse:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
            imageCoord:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
            imageProf:
                'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
          ),
        ],
      ),
    );
  }

  Card cursoPagtoPix({
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
                    Text(
                      turma,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                                InkWell(
                                  onTap: () =>
                                      AppLaunch.launch('https://discord.com'),
                                  child: const Icon(
                                    Icons.discord,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                ),
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
                                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
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
          const Text('Pedido feito em: 10-06-2022 as 16:34'),
          const Text('Investimento no Curso: R\$ 100.00'),
          const Text('Modalidade de pagamento: PIX'),
          const Text('Opção: 1x'),
          const Text('Pagamento realizado em: 10-06-2022 as 16:34'),
          const Text('Código da transação: f2342fsdffw342rweasds343ssd'),
          Row(
            children: const [
              Text('Progresso nos estudos:'),
              SizedBox(width: 5),
              LinearPercentIndicator(percent: 0.213),
            ],
          )
        ],
      ),
    );
  }

  Card cursoPagtoBankslip(
      {required String name,
      required String imageCourse,
      required String imageCoord,
      required String imageProf}) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
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
                                      child: const Icon(Icons.web),
                                    ),
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
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'INVESTIMENTO NO CURSO R\$ 100,00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Valor pago a vista no boleto')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card cursoPagtoCard(
      {required String name,
      required String imageCourse,
      required String imageCoord,
      required String imageProf}) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
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
                                      child: const Icon(Icons.web),
                                    ),
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
          Container(
            // height: 25,
            color: Colors.green,
            padding: const EdgeInsets.all(5),
            child: const Text(
              'INVESTIMENTO NO CURSO R\$ 100,00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
