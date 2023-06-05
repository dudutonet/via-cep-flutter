import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/usecases/get_address_by_cep_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/cep_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_cep_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_user_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/get_user_address_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/get_user_by_id_usecase.dart';

class NewUserController {
  final CreateUserUsecase createUserUsecase;
  final CreateCepUsecase createCepUsecase;
  final GetAddressByCepUsecase getAddressByCepUsecase;
  final GetUserAddresUsecase getUserAddresUsecase;
  final GetUserByIdUsecase getUserByIdUsecase;

  NewUserController({
    required this.createUserUsecase,
    required this.createCepUsecase,
    required this.getAddressByCepUsecase,
    required this.getUserByIdUsecase,
    required this.getUserAddresUsecase,
  });

  final formKey = GlobalKey<FormState>();
  ValueNotifier<UserEntity> user = ValueNotifier<UserEntity>(UserEntity());
  ValueNotifier<CepEntity> cep = ValueNotifier<CepEntity>(CepEntity());

  TextEditingController streetController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController ibgeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

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

  getUserAddress(String? cep) async {
    if (cep != null) {
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
  }

  void edit(UserEntity? user) {
    if (user != null) {
      this.user.value = user;
      changeUser(user);
    } else {
      this.user.value = UserEntity();
    }
  }

  changeUser(UserEntity user) {
    change(
      fullname: user.fullname,
      complement: user.complement,
      cep: user.cep!.cep,
      city: user.cep!.city,
      ddd: user.cep!.ddd,
      ibge: user.cep!.ibge,
      neighborhood: user.cep!.neighborhood,
      street: user.cep!.street,
      login: user.login,
      number: user.number,
      phone: user.phone,
      uf: user.password,
    );
  }

  void change({
    String? fullname,
    String? login,
    String? password,
    String? cep,
    String? number,
    String? complement,
    String? phone,
    String? street,
    String? neighborhood,
    String? city,
    String? uf,
    String? ibge,
    String? ddd,
  }) {
    if (street != null) streetController.text = street;
    if (neighborhood != null) neighborhoodController.text = neighborhood;
    if (city != null) cityController.text = city;
    if (uf != null) ufController.text = uf;
    if (ibge != null) ibgeController.text = ibge;

    CepEntity? cepMoodel;
    if (user.value.cep != null) {
      cepMoodel = CepEntity(
        cep: cep,
        city: city,
        ddd: ddd,
        ibge: ibge,
        neighborhood: neighborhood,
        street: street,
        uf: uf,
      );
    }

    user.value = user.value.copyWith(
      fullname: fullname,
      cep: cepMoodel,
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
      phoneController.clear();
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  bool validate() {
    return formKey.currentState!.validate();
  }
}
