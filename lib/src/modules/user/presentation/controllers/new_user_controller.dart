import 'package:flutter/material.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_user_usecase.dart';

class NewUserController {
  final CreateUserUsecase createUserUsecase;

  NewUserController({required this.createUserUsecase});

  final formKey = GlobalKey<FormState>();
  UserEntity user = UserEntity();

  void edit(UserEntity? user) {
    if (user != null) {
      this.user = user;
    } else {
      this.user = UserEntity();
    }
  }

  void change({
    String? fullname,
    String? login,
    String? password,
    String? cep,
    String? number,
    String? complement,
    String? phone,
  }) {
    user = user.copyWith(
      fullname: fullname,
      cep: cep,
      complement: complement,
      login: login,
      number: number,
      password: password,
      phone: phone,
    );
  }

  Future<void> create() async {
    if (!validate()) return;

    final result = await createUserUsecase(user);

    result.fold((l) => null, (r) => {});
  }

  bool validate() {
    return formKey.currentState!.validate();
  }
}
