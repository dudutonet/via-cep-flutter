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

    controller = Modular.get<ListUserController>()..list();
  }

  Widget listUsers() {
    return ValueListenableBuilder(
        valueListenable: controller.users,
        builder: (context, users, child) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(users[index].fullname!),
              subtitle: Text(
                '${users[index].cep}',
              ),
              onTap: () {
                Modular.to.navigate('new_user', arguments: users[index].id);
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuários"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            icon: const Icon(Icons.home)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.navigate('new_user'),
        child: const Icon(Icons.add),
      ),
      body: listUsers(),
    );
  }
}
