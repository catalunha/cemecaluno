import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_clipboard_helper.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/app_number_formfield.dart';
import 'package:aluno/app/presentation/views/utils/app_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class PurchaseCart extends StatefulWidget {
  String tipoPay = Get.arguments;
  PurchaseCart({Key? key}) : super(key: key);

  @override
  State<PurchaseCart> createState() => _PurchaseCartState();
}

class _PurchaseCartState extends State<PurchaseCart> {
  final _formKey = GlobalKey<FormState>();
  final _nameCardTEC = TextEditingController();
  final _numberCardTEC = TextEditingController();
  final _yearValidCardTEC = TextEditingController();
  final _monthValidCardTEC = TextEditingController();
  final _codeCardTEC = TextEditingController();
  final pixOption = [0, 1];
  var pixOptionIndex = 0;
  final items = ['A vista', '4x de R\$ 25.00'];
  String? item;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameCardTEC.text = "";
    _numberCardTEC.text = "";
    _yearValidCardTEC.text = "";
    _monthValidCardTEC.text = "";
    _codeCardTEC.text = "";
    item = items[0];
    print(widget.tipoPay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Seu carrinho'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            // runAlignment: WrapAlignment.center,
            children: [
              // if (widget.tipoPay == 'pix')
              cursoPagtoPix(
                name: 'nomeCurso04 (Pagar com PIX)',
                turma: '2022.1',
                imageCourse:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                imageCoord:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                imageProf:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
              ),
              // if (widget.tipoPay == 'bankslip')
              cursoPagtoBankslip(
                name: 'nomeCurso05 (Pagar com Boleto)',
                turma: '2022.1',
                imageCourse:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                imageCoord:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                imageProf:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
              ),
              // if (widget.tipoPay == 'card')
              cursoPagtoCard(
                name: 'nomeCurso06 (Pagar com Cartão)',
                turma: '2022.1',
                imageCourse:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/02f4d2918c8b90cce0578b4838c00cfd_auriculo.jpg',
                imageCoord:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                imageProf:
                    'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cursoPagtoPix({
    required String name,
    required String turma,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return SizedBox(
      width: 375,
      child: Card(
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
                      Text(
                        turma,
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
                  Text('Valor pago a vista no PIX')
                ],
              ),
            ),
            const Text('Opções de pagamento com PIX'),
            DropdownButton<String>(
              value: item,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (value) {
                setState(() {
                  item = value!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Gerar QRCode.')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Segue dados para pagamento com PIX'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/dbe7664facb9318f5dd93b8db7c45a7b_qrcode.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const Text('Pix Copia e Cola'),
                    InkWell(
                        onTap: () {
                          AppClipboardHelper.copy('codigo do pix');
                          Get.snackbar(
                            'PIX copiado',
                            'Cole no aplicativo de seu banco',
                            backgroundColor: Colors.yellowAccent,
                            margin: const EdgeInsets.all(10),
                          );
                        },
                        child: const Text('Click aqui')),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cursoPagtoBankslip({
    required String name,
    required String turma,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return SizedBox(
      width: 375,
      child: Card(
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
                      Text(
                        turma,
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
            const Text('Opções de pagamento com Boleto'),
            DropdownButton<String>(
              value: item,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (value) {
                setState(() {
                  item = value!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Gerar Boleto.')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Segue dados para pagamento com Boleto'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/fbeae4ba125a7417f7decb33570a6d3c_barcode.png',
                  // width: 375,
                  // height: 25,
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                InkWell(
                    onTap: () {
                      AppLaunch.launch(
                          'https: //parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/0bbca0962858fdc6faeac20ca7c34782_boleto.pdf');
                    },
                    child: const Text('Baixa boleto. Click aqui.'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cursoPagtoCard({
    required String name,
    required String turma,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return SizedBox(
      width: 375,
      child: Card(
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
                      Text(
                        turma,
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
                'INVESTIMENTO NO CURSO \$ 100,00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text('Opções de pagamento com Cartão'),
            DropdownButton<String>(
              value: item,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (value) {
                setState(() {
                  item = value!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Column(
            //   // crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     RadioListTile<int>(
            //       title: const Text('1) Pagamento a vista'),
            //       value: 0,
            //       groupValue: pixOption[pixOptionIndex],
            //       onChanged: (int? value) {
            //         setState(() {
            //           pixOptionIndex = value!;
            //         });
            //       },
            //     ),
            //     RadioListTile<int>(
            //       title: const Text('2) Pagamento em 4x de R$25,00'),
            //       value: 1,
            //       groupValue: pixOption[pixOptionIndex],
            //       onChanged: (int? value) {
            //         setState(() {
            //           pixOptionIndex = value!;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Informe dados para pagamento com cartão'),
                Text('(nenhuma informação será salva no aplicativo)'),
                // Text('(informação criptogravada de ponta-a-ponta)'),
              ],
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // width: 300,
                child: Column(
                  children: [
                    AppTextFormField(
                      label: 'Nome igual ao cartão',
                      controller: _nameCardTEC,
                      validator: Validatorless.required('Nome é obrigatório'),
                    ),
                    AppNumberFormField(
                      label: 'Numero do cartão',
                      controller: _numberCardTEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Nome é obrigatório'),
                        Validatorless.number('Valor deve ser número'),
                      ]),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppNumberFormField(
                            label: 'Ano validade.',
                            controller: _yearValidCardTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Ano é obrigatório'),
                              Validatorless.number('Valor deve ser número'),
                              Validatorless.min(2020, 'Ano mínimo é 2020'),
                              Validatorless.max(2023, 'Ano máximo é 2023'),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AppNumberFormField(
                            label: 'Mês validade.',
                            controller: _monthValidCardTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Mês é obrigatório'),
                              Validatorless.number('Mês deve ser número'),
                              Validatorless.min(1, 'Mês mínimo é 1'),
                              Validatorless.max(1, 'Mês máximo é 12'),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AppNumberFormField(
                            label: 'Código verso',
                            controller: _codeCardTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Código é obrigatório'),
                              Validatorless.number('Código deve ser número'),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text('Enviar dados para análise.'))
          ],
        ),
      ),
    );
  }
}
