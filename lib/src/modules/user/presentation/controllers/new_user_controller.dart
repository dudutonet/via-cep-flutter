import 'package:flutter/material.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/usecases/get_address_by_cep_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_user_usecase.dart';

class NewUserController {
  final CreateUserUsecase createUserUsecase;
  final GetAddressByCepUsecase getAddressByCepUsecase;

  NewUserController({
    required this.createUserUsecase,
    required this.getAddressByCepUsecase,
  });

  final formKey = GlobalKey<FormState>();
  ValueNotifier<UserEntity> user = ValueNotifier<UserEntity>(UserEntity());

  getAddress(String cep) async {
    final result = await getAddressByCepUsecase(cep);

    result.fold((l) => null, (address) {
      change(
        cep: address.cep,
      );
    });
  }

  void edit(UserEntity? user) {
    if (user != null) {
      this.user.value = user;
    } else {
      this.user.value = UserEntity();
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
    user.value = user.value.copyWith(
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

    final result = await createUserUsecase(user.value);

    result.fold((l) => null, (r) => {});
  }

  bool validate() {
    return formKey.currentState!.validate();
  }
}
