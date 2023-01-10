import '../../data/model/basic_product/product_dto.dart';

abstract class ProductState {
  final List<ProductDto> products;

  const ProductState({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductInitialized extends ProductState {
  final List<ProductDto> products;

  const ProductInitialized({required this.products})
      : super(products: products);

  @override
  List<Object> get props => [products];

  @override
  String toString() => 'ProductAdded { todos: $products }';

  @override
  initState({angle}) {
    // TODO: implement initState
    throw UnimplementedError();
  }
}

class ProductInLoad extends ProductState {
  const ProductInLoad() : super(products: const []);
}

class ProductSuccessful extends ProductState {
  const ProductSuccessful(List<ProductDto> products)
      : super(products: products);
}

class ProductFailed extends ProductState {
  const ProductFailed() : super(products: const []);
}

class ProductsEmpty extends ProductState {
  const ProductsEmpty() : super(products: const []);
}
