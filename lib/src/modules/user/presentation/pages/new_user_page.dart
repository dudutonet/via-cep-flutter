import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/new_user_controller.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  late final NewUserController controller;

  @override
  void initState() {
    super.initState();

    controller = Modular.get<NewUserController>();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('NewUser'),
    );
  }
}
