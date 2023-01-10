import 'dart:async';

import 'package:logger/error_reporter.dart';
import 'package:network/network.dart';
import 'package:wopta/authentication/data/model/user_dto.dart';

import '../model/user_privacy_options_dto.dart';
import '../model/user_registry_dto.dart';

class GetUserRegistryFailure implements Exception {}

class UserService {
  final String baseUrl;
  final DioService service;
  final ErrorReporter reporter;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference userCollection =
      firebaseFirestore.collection('users');

  final String _userDataEndpoint = 'WebApiProduct/Api/RicercaAnagSemplice';
  final String _updateUserDataEndpoint =
      'WebApiProduct/Api/inserimentoanagrafica';
  final String _validateUserMailEndpoint = 'mail/v1/validate';

  UserService({
    required this.baseUrl,
    required this.service,
    required this.reporter,
  });

  Future<User> getUserFirebase() async {
    return firebaseAuth.currentUser!;
  }

  Future<UserDto> getUserFirestoreDocument() async {
    final userId = (await getUserFirebase()).uid;
    final userDoc = await userCollection.doc(userId).get();
    return UserDto.fromJson(userDoc.data() as Map<String, dynamic>);
  }

  Future<List<UserRegistryDto>> getUserRegistries(
    String fiscalCode, {
    String languageCode = 'it',
  }) async {
    final url = baseUrl + _userDataEndpoint;
    final params = {
      "idNodo": "1",
      "cdFiscale": fiscalCode,
      "cdLingua": languageCode
    };
    final response = await service.request(
      url: url,
      method: Method.POST,
      params: params,
    );

    Map<String, dynamic> jsonResponse =
        Map<String, dynamic>.from(response.data);

    try {
      return List<UserRegistryDto>.from(jsonResponse['listAnagrafiche'].map(
          (userRegistryJson) => UserRegistryDto.fromJson(userRegistryJson)));
    } catch (e, s) {
      reporter.logException(e, s);
      throw GetUserRegistryFailure();
    }
  }

  Future<void> updateUserPrivacyData(
    String id,
    UserPrivacyOptionsDto userPrivacyOptionsDto,
  ) async {
    return userCollection
        .doc(id)
        .update({"privacyOptions": userPrivacyOptionsDto.toJson()});
  }

  Future<void> updateUserPictureUrl(
    String id,
    String pictureUrl,
  ) async {
    return userCollection.doc(id).update({"pictureUrl": pictureUrl});
  }

  Future<bool> validateUserMail(
    String mail,
  ) async {
    final url = baseUrl + _validateUserMailEndpoint;
    final params = {"mail": mail};
    final response = await service.request(
      url: url,
      method: Method.POST,
      params: params,
    );

    Map<String, dynamic> jsonResponse =
        Map<String, dynamic>.from(response.data);

    return jsonResponse['isValid'] ?? false;
  }
}
