import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/list_user_controller.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({super.key});

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  late final ListUserController controller;

  late List<UserEntity> users = [];

  @override
  void initState() {
    super.initState();

    controller = Modular.get<ListUserController>();
    controller.users.addListener(() {
      setState(() {
        users = controller.users.value;
      });
    });
    controller.list();
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
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(users[index].fullname!),
          subtitle: Text(
            'Telefone: ${UtilBrasilFields.obterTelefone(users[index].phone!)}',
          ),
          onTap: () => {
            Modular.to.navigate('new_user', arguments: {
              "user": users[index],
            })
          },
        ),
      ),
    );
  }
}
