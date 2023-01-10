import 'package:cache/cache.dart';
import 'model/basic_product/product_dto.dart';
import 'model/complete_product/product.dart';
import 'product_service.dart';

class ProductRepository {
  final ProductService productService;
  final CacheClient cache;

  final String productCacheKey = '__product_cache_key__';

  List<ProductDto> get currentProducts {
    return cache.read<List<ProductDto>>(key: productCacheKey) ??
        [];
  }

  ProductRepository({
    required this.productService,
    CacheClient? cache,
  }) : cache = cache ?? CacheClient();

  Future<List<ProductDto>> fetchProductsNew(
    String fiscalCode,
  ) async {
    final products = await productService.getUserProducts(fiscalCode);
    final validProducts = products
        .where((product) =>
            product.statoPolizza?.toLowerCase() == 'polizza in vita')
        .toList();
    cache.write(key: productCacheKey, value: validProducts);
    return validProducts;
  }

  Future<Product> fetchProduct(String productId) {
    return productService.getCompleteProduct(productId);
  }

  Future<String> fetchDocumentAsBase64(String attachmentId) {
    return productService.getProductAttachment(attachmentId);
  }
}
