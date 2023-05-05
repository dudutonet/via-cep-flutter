import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/list_user_controller.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({super.key});

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  late final ListUserController controller;

  @override
  void initState() {
    super.initState();

    controller = Modular.get<ListUserController>();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('ListUsers'),
    );
  }
}
