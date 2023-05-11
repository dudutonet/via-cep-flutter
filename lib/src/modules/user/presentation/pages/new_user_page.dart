import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/new_user_controller.dart';

class NewUserPage extends StatefulWidget {
  final UserEntity? user;

  const NewUserPage({super.key, required this.user});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  late final NewUserController controller;

  String? _passwordCache;
  String? _confirmPasswordCache;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<NewUserController>()..edit(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
        leading: IconButton(
            onPressed: () {
              Modular.to.navigate("/");
            },
            icon: const Icon(Icons.home)),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.user,
        builder: (context, user, child) {
          return Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.all(10.0)),
                  CustomTextField(
                    label: 'Nome completo',
                    icon: Icons.person,
                    hint: 'Digite seu nome',
                    initialValue: user.fullname ?? '',
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(fullname: text),
                  ),
                  CustomTextField(
                    label: 'Telefone',
                    hint: 'Digite o telefone',
                    initialValue: user.phone?.toString() ?? '',
                    icon: Icons.phone,
                    onSave: (text) => controller.change(phone: text),
                    inputFormatters: [TelefoneInputFormatter()],
                    validators: [requiredValidator],
                  ),
                  CustomTextField(
                    label: 'CEP',
                    hint: 'Digite o CEP',
                    icon: Icons.house,
                    initialValue: user.cep?.toString() ?? '',
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(cep: text),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, CepInputFormatter()],
                  ),
                  CustomTextField(
                    label: 'Número',
                    hint: 'Digite o número',
                    validators: [requiredValidator],
                    initialValue: user.number?.toString() ?? '',
                    onSave: (text) => controller.change(number: text),
                  ),
                  CustomTextField(
                    label: 'Complemento',
                    hint: 'Digite o complemento',
                    initialValue: user.complement ?? '',
                    onSave: (text) => controller.change(complement: text),
                  ),
                  CustomTextField(
                    label: 'Login',
                    hint: 'Digite o login',
                    icon: Icons.person,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(login: text),
                    initialValue: user.login ?? '',
                  ),
                  CustomTextField(
                    label: 'Senha',
                    hint: 'Digite a senha',
                    icon: Icons.key,
                    validators: [requiredValidator],
                    initialValue: '',
                    onChanged: (text) => _passwordCache = text,
                    onSave: (text) => controller.change(password: text),
                    password: true,
                  ),
                  CustomTextField(
                    label: 'Confirme a senha',
                    hint: 'Confirme a senha',
                    icon: Icons.key,
                    initialValue: '',
                    validators: [requiredValidator, passwordConfirmValidator],
                    onChanged: (text) => _confirmPasswordCache = text,
                    password: true,
                  ),
                  SizedBox(
                    // width: double.infinity,
                    // height: 50,
                    child: ElevatedButton.icon(
                      label: const Text('Salvar'),
                      icon: const Icon(Icons.save),
                      onPressed: () {
                        controller.create();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? requiredValidator(text) {
    return text == null || text.isEmpty ? 'O campo é obrigatório' : null;
  }

  String? passwordConfirmValidator(text) {
    return _confirmPasswordCache != _passwordCache ? 'As senhas não conrrespondem' : null;
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;

  final IconData? icon;
  final List<String? Function(String text)> validators;
  final void Function(String? text)? onSave;
  final void Function(String? text)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final bool password;
  final String initialValue;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.initialValue,
    this.onSave,
    this.icon,
    this.validators = const [],
    this.inputFormatters = const [],
    this.password = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            for (var validator in validators) {
              var validatorResult = validator.call(value!);
              if (validatorResult != null) {
                return validatorResult;
              }
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: onSave,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder(),
            prefixIcon: icon == null ? null : Icon(icon),
          ),
          inputFormatters: inputFormatters,
          obscureText: password,
        ),
        const Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }
}
