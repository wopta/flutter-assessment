import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class InitProduct extends ProductEvent {}

class RefreshedProduct extends ProductEvent {}
