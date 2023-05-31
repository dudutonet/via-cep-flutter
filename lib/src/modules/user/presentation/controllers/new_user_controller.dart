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

  TextEditingController streetController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController ibgeController = TextEditingController();

  getAddress(String cep) async {
    final result = await getAddressByCepUsecase(cep);

    result.fold((l) => () {}, (address) {
      change(
          cep: address.cep,
          street: address.logradouro,
          neighborhood: address.bairro,
          city: address.localidade,
          uf: address.uf,
          ibge: address.ibge);
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
    String? street,
    String? neighborhood,
    String? city,
    String? uf,
    String? ibge,
    String? number,
    String? complement,
    String? phone,
  }) {
    if (street != null) streetController.text = street;
    if (neighborhood != null) neighborhoodController.text = neighborhood;
    if (city != null) cityController.text = city;
    if (uf != null) ufController.text = uf;
    if (ibge != null) ibgeController.text = ibge;

    user.value = user.value.copyWith(
      fullname: fullname,
      cep: cep,
      street: street,
      neighborhood: neighborhood,
      city: city,
      uf: uf,
      ibge: ibge,
      complement: complement,
      login: login,
      number: number,
      password: password,
      phone: phone,
    );
  }

  Future<void> create(context) async {
    if (!validate()) return;

    final result = await createUserUsecase(user.value);

    result.fold((l) => null, (r) {
      streetController.clear();
      neighborhoodController.clear();
      cityController.clear();
      ufController.clear();
      ibgeController.clear();
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  bool validate() {
    return formKey.currentState!.validate();
  }
}
