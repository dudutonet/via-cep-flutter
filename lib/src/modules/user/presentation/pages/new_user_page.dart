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

  String? _cep;
  String? _passwordCache;
  String? _confirmPasswordCache;
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = Modular.get<NewUserController>()..edit(widget.user);

    focus.addListener(() {
      if (!focus.hasFocus) {
        controller.getAddress(_cep ?? '');
      }
    });
    super.initState();
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
                    hint: 'Informe seu nome completo',
                    initialValue: user.fullname ?? '',
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(fullname: text),
                  ),
                  CustomTextField(
                    label: 'Login',
                    hint: 'Informe seu login',
                    icon: Icons.person,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(login: text),
                    initialValue: user.login ?? '',
                  ),
                  CustomTextField(
                    label: 'Senha',
                    hint: 'Informe a senha',
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
                  CustomTextField(
                    label: 'Telefone',
                    hint: 'Informe seu telefone',
                    initialValue: user.phone?.toString() ?? '',
                    icon: Icons.phone,
                    onSave: (text) => controller.change(phone: text),
                    inputFormatters: [TelefoneInputFormatter()],
                    validators: [requiredValidator],
                  ),
                  CustomTextField(
                    label: 'CEP',
                    hint: 'Informe o CEP',
                    icon: Icons.map,
                    initialValue: user.cep?.toString() ?? '',
                    validators: [requiredValidator],
                    onChanged: (text) => _cep = text,
                    onSave: (text) => controller.change(cep: text),
                    focus: focus,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                  ),
                  CustomTextField(
                    controller: controller.neighborhoodController,
                    label: 'Bairro',
                    hint: 'Informe o bairro',
                    icon: Icons.house,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(neighborhood: text),
                  ),
                  CustomTextField(
                    controller: controller.streetController,
                    label: 'Rua',
                    hint: 'Informe a rua',
                    icon: Icons.arrow_upward,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(street: text),
                  ),
                  CustomTextField(
                    controller: controller.cityController,
                    label: 'Cidade',
                    hint: 'Informe a Cidade',
                    icon: Icons.location_city,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(city: text),
                  ),
                  CustomTextField(
                    controller: controller.ufController,
                    label: 'UF',
                    hint: 'UF',
                    icon: Icons.public,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(uf: text),
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
                    controller: controller.ibgeController,
                    label: 'IBJE',
                    hint: 'IBJE',
                    enabled: false,
                    readOnly: true,
                    icon: Icons.abc,
                    validators: [requiredValidator],
                    onSave: (text) => controller.change(ibge: text),
                  ),
                  SizedBox(
                    // width: double.infinity,
                    // height: 50,
                    child: ElevatedButton.icon(
                      label: const Text('Salvar'),
                      icon: const Icon(Icons.save),
                      onPressed: () {
                        controller.create(context);
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
    return _confirmPasswordCache != _passwordCache
        ? 'As senhas não conrrespondem'
        : null;
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final bool enabled;
  final bool password;
  final bool readOnly;
  final String? initialValue;
  final IconData? icon;
  final FocusNode? focus;
  final List<TextInputFormatter> inputFormatters;
  final List<String? Function(String text)> validators;
  final void Function(String? text)? onChanged;
  final void Function(String? text)? onSave;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.password = false,
    this.icon,
    this.focus,
    this.inputFormatters = const [],
    this.validators = const [],
    this.onChanged,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
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
          enabled: enabled,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder(),
            prefixIcon: icon == null ? null : Icon(icon),
          ),
          focusNode: focus,
          inputFormatters: inputFormatters,
          obscureText: password,
        ),
        const Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }
}
