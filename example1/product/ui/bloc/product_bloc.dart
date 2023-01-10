import 'dart:async';

import 'package:cache/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wopta/product/ui/bloc/product_state.dart';
import 'package:wopta/product/data/product_repository.dart';

import '../../../authentication/data/repository/authentication_repository.dart';
import '../../../authentication/ui/model/app_user_model.dart';
import 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  final AuthenticationRepository authRepository;
  late final StreamSubscription<AppUserModel> _userSubscription;

  ProductBloc(
      {CacheClient? cache,
      required this.repository,
      required this.authRepository})
      : super(const ProductInitialized(
          products: [],
        )) {
    on<InitProduct>(initEventHandler);
    on<RefreshedProduct>(initEventHandler);
    _userSubscription = authRepository.user.listen((event) {
      add(InitProduct());
    });
  }

  Future<void> initEventHandler(event, Emitter<ProductState> emit) async {
    emit(const ProductInLoad());
    final user = authRepository.currentUser;

    try {
      final products = await repository.fetchProductsNew(user.fiscalCode);
      if (products.isEmpty) {
        emit(const ProductsEmpty());
      } else {
        emit(ProductSuccessful(products));
      }
    } catch (e, s) {
      emit(const ProductFailed());
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
