import 'dart:async';

import 'package:cache/cache.dart';
import 'package:network/network.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wopta/authentication/data/repository/user_repository.dart';
import 'package:wopta/authentication/ui/model/app_user_model.dart';

import '../model/user_privacy_options_dto.dart';
import '../../domain/model/authentication_errors.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  final UserRepository userRepository;

  /// {@macro authentication_repository}
  AuthenticationRepository(
      {CacheClient? cache,
      FirebaseAuth? firebaseAuth,
      FirebaseFirestore? firebaseFirestore,
      required this.userRepository})
      : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference usersCollection =
      _firebaseFirestore.collection('users');
  final CacheClient _cache;

  static const userCacheKey = '__user_cache_key__';

  late final Stream<User?> _firebaseUserChanges = _firebaseAuth.userChanges().asBroadcastStream();

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  late Stream<AppUserModel> user = _user;

  Stream<AppUserModel> get _user {
    StreamSubscription<User?>? subscription;
    BehaviorSubject<AppUserModel>? userStreamController;

    void startUserStream() async {
      subscription = _firebaseUserChanges.listen((firebaseUser) async {
        if (firebaseUser == null) {
          _cache.write(key: userCacheKey, value: AppUserModel.empty);
          userStreamController!.add(AppUserModel.empty);
          return;
        } else {
          final user = await userRepository.getUserByFiscalCode();
          _cache.write(key: userCacheKey, value: user);
          userStreamController!.add(user);
          return;
        }
      });
    }

    void stopUserStream() {
      subscription?.cancel();
      userStreamController = null;
    }

    userStreamController = BehaviorSubject<AppUserModel>(
      onListen: startUserStream,
      onCancel: stopUserStream,
    );

    return userStreamController!;
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  AppUserModel get currentUser {
    return _cache.read<AppUserModel>(key: userCacheKey) ?? AppUserModel.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({
    required String email,
    required String password,
    required String fiscalCode,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;

      await usersCollection.doc(user.uid).set({
        'uid': user.uid,
        'fiscalCode': fiscalCode,
        'emailVerified': user.emailVerified
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [_user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// Reloads the current user which will reemit
  /// from the [_user] Stream.
  ///
  /// Throws a [ReloadUserFailure] if an exception occurs.
  Future<void> reloadUser() async {
    try {
      return _firebaseAuth.currentUser?.reload();
    } catch (_) {
      throw ReloadUserFailure();
    }
  }

  Future<void> updateUserPrivacyOptions(
    UserPrivacyOptionsDto privacyOptions,
  ) async {
    try {
      await userRepository.updateUserPrivacyOptions(
        currentUser,
        privacyOptions,
      );
      return reloadUser();
    } catch (_) {
      throw ReloadUserFailure();
    }
  }

  Future<void> updateUserPictureUrl(
    String pictureUrl,
  ) async {
    try {
      await userRepository.updateUserPictureUrl(
        currentUser,
        pictureUrl,
      );
      return reloadUser();
    } catch (_) {
      throw ReloadUserFailure();
    }
  }
}
