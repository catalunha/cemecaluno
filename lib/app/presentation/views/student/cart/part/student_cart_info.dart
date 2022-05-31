import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:flutter/material.dart';

class StudentCartInfo extends StatelessWidget {
  final StudentCartModel studentCartModel;
  const StudentCartInfo({Key? key, required this.studentCartModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        studentCartModel.generatedCob
            ? const SizedBox()
            : ElevatedButton(
                onPressed: () {},
                child: const Text('Criar pagamento.'),
              ),
        IconButton(
          tooltip: 'Excluir pagamento',
          onPressed: () {},
          icon: const Icon(Icons.delete_forever),
        )
      ],
    );
  }
}
