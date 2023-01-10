import 'package:equatable/equatable.dart';
import 'package:wopta/authentication/data/model/user_privacy_options_dto.dart';
import 'package:wopta/authentication/ui/model/user_business.dart';
import 'package:wopta/product/ui/model/product_model.dart';

class AppUserModel extends Equatable {
  final String id;
  final String tenant;
  final String name;
  final String surname;
  final List<UserBusiness> businesses;
  final String phone;
  final String email;
  final String address;
  final String fiscalCode;
  final String role;
  final String? pictureUrl;
  final List<ProductModel> products;
  final UserPrivacyOptionsDto? privacyOptions;

  const AppUserModel(
      {required this.id,
      required this.name,
      required this.surname,
      this.businesses = const [],
      required this.phone,
      required this.email,
      required this.address,
      required this.fiscalCode,
      required this.role,
      required this.pictureUrl,
      this.products = const [],
      this.privacyOptions,
      this.tenant = 'wopta'});

  static const AppUserModel empty = AppUserModel(
    id: '',
    name: '',
    surname: '',
    businesses: [],
    phone: '',
    email: '',
    address: '',
    fiscalCode: '',
    role: '',
    pictureUrl: '',
    products: [],
  );

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == AppUserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != AppUserModel.empty;

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, surname, phone, email, address, fiscalCode, role, pictureUrl];
}
