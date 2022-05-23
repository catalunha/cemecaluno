import 'package:aluno/app/presentation/controllers/user/profile/user_profile_controller.dart';
import 'package:aluno/app/presentation/views/user/profile/part/user_profile_photo.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);
  final UserProfileController _userProfileController = Get.find();

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameTec = TextEditingController();
  final _nameTagTec = TextEditingController();
  final _descriptionTec = TextEditingController();
  final _discordTec = TextEditingController();
  final _telegramTec = TextEditingController();
  bool isWoman = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameTec.text =
        widget._userProfileController.userProfile?.fullName ?? "";
    _nameTagTec.text = widget._userProfileController.userProfile?.nameTag ?? "";
    _descriptionTec.text =
        widget._userProfileController.userProfile?.description ?? "";
    _discordTec.text = widget._userProfileController.userProfile?.discord ?? "";
    _telegramTec.text =
        widget._userProfileController.userProfile?.telegram ?? "";
    isWoman = widget._userProfileController.userProfile?.isWoman ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Editar seu perfil'),
      ),
      body: Form(
        key: _formKey,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextFormField(
                  label: 'Nome completo para certificado.',
                  controller: _fullNameTec,
                  validator:
                      Validatorless.required('Nome completo é obrigatório'),
                ),
                AppTextFormField(
                  label: 'Nome curto mais conhecido para crachá.',
                  controller: _nameTagTec,
                  validator: Validatorless.required('Nome curto é obrigatório'),
                ),
                AppTextFormField(
                  label: 'Breve descrição sobre você.',
                  controller: _descriptionTec,
                ),
                AppTextFormField(
                  label: 'Seu nome de usuário no Telegram.',
                  controller: _telegramTec,
                ),
                AppTextFormField(
                  label: 'Seu nome de usuário no discord.',
                  controller: _discordTec,
                ),
                checkIsWoman(),
                UserProfilePhoto(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      await widget._userProfileController.append(
                        fullName: _fullNameTec.text,
                        nameTag: _nameTagTec.text,
                        description: _descriptionTec.text,
                        isWoman: isWoman,
                        telegram: _telegramTec.text,
                        discord: _discordTec.text,
                      );
                      Get.back();
                    }
                  },
                  child: const Text('Salvar atualização.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SwitchListTile checkIsWoman() {
    return SwitchListTile(
      value: isWoman,
      onChanged: (value) {
        setState(() {
          isWoman = value;
        });
      },
      title: isWoman
          ? const Text(
              'O sistema usará adjetivos FEMININOS para se referir a você.')
          : const Text(
              'O sistema usará adjetivos MASCULINOS para se referir a você.'),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
