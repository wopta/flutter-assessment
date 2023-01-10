import 'package:extensions/string_extensions.dart';
import 'package:logger/error_reporter.dart';
import 'package:network/network.dart';
import 'package:wopta/authentication/data/repository/user_service.dart';
import 'package:wopta/authentication/ui/model/app_user_model.dart';
import 'package:wopta/authentication/ui/model/user_business.dart';

import '../model/user_dto.dart';
import '../model/user_privacy_options_dto.dart';
import '../model/user_registry_dto.dart';

class UpdateUserPrivacyOptionsFailure implements Exception {}

class UpdateUserPictureFailure implements Exception {}

class GetUserByFiscalCodeFailure implements Exception {}

class UserRepository {
  final UserService userService;
  final ErrorReporter reporter;

  UserRepository({required this.userService, required this.reporter});

  Future<AppUserModel> getUserByFiscalCode() async {
    List<UserRegistryDto> registries = [];
    User firebaseUser;
    UserDto userDto;
    try {
      firebaseUser = await userService.getUserFirebase();
      userDto = await userService.getUserFirestoreDocument();
      registries = await userService.getUserRegistries(userDto.fiscalCode);
    } catch (e, s) {
      reporter.logException(e, s);
      throw GetUserByFiscalCodeFailure();
    }

    UserRegistryDto? userRegistry;
    List<UserRegistryDto> businessRegistries = [];

    if (registries.isNotEmpty) {
      final personRegistries =
          registries.where((element) => element.isPersonRegistry());

      if (personRegistries.isNotEmpty) {
        userRegistry = personRegistries.first;
      }

      businessRegistries =
          registries.where((element) => element.isBusinessRegistry()).toList();
    }

    final userBusinesses = businessRegistries
        .map(
          (e) => UserBusiness(
            id: e.id?.toString(),
            name: e.businessName.ifEmptyOrNull(e.name.orEmpty()),
            address: e.address?.addressDescription,
            vatCode: e.vatNumber,
          ),
        )
        .toList(growable: false);

    return AppUserModel(
      id: firebaseUser.uid,
      name: userRegistry?.name ?? '',
      surname: userRegistry?.surname ?? '',
      businesses: userBusinesses,
      phone: '',
      email: firebaseUser.email.orEmpty(),
      address: userRegistry?.address?.addressDescription ?? '',
      fiscalCode: userRegistry?.fiscalCode ?? userDto.fiscalCode,
      role: userDto.role.orEmpty(),
      pictureUrl: userDto.pictureUrl,
      privacyOptions: userDto.privacyOptions,
    );
  }

  Future<void> updateUserPrivacyOptions(
    AppUserModel user,
    UserPrivacyOptionsDto privacyOptions,
  ) async {
    try {
      return userService.updateUserPrivacyData(user.id, privacyOptions);
    } catch (e, s) {
      reporter.logException(e, s);
      throw UpdateUserPrivacyOptionsFailure();
    }
  }

  Future<void> updateUserPictureUrl(
    AppUserModel user,
    String pictureUrl,
  ) async {
    try {
      return userService.updateUserPictureUrl(user.id, pictureUrl);
    } catch (e, s) {
      reporter.logException(e, s);
      throw UpdateUserPictureFailure();
    }
  }

  Future<bool> validateUserMail(String mail) async {
    return userService.validateUserMail(mail);
  }
}
