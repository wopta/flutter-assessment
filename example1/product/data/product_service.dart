import 'package:network/network.dart';

import 'model/basic_product/product_dto.dart';
import 'model/complete_product/product.dart';

class ProductService {
  final String baseUrl;
  final DioService service;

  final String _getUserProductsEndpoint =
      'WebApiProduct/Api/RicercaPolizzaCliente';
  final String _getCompleteProductEndpoint =
      'WebApiProduct/Api/GetPolizzaCompleta';
  final String _getProductAttachmentEndpoint =
      'WebApiProduct/Api/recuperaAllegato';

  ProductService({required this.baseUrl, required this.service});

  Future<List<ProductDto>> getUserProducts(
    String fiscalCode, {
    String languageCode = 'it',
  }) async {
    final url = baseUrl + _getUserProductsEndpoint;
    final params = {"codiceFiscalePIva": fiscalCode, "cdLingua": languageCode};
    final request = await service.request(
      url: url,
      method: Method.POST,
      params: params,
    );

    return List<ProductDto>.from(
      (request.data['listRisultatoRicerca'] ?? []).map(
        (x) => ProductDto.fromJson(x),
      ),
    );
  }

  Future<Product> getCompleteProduct(
    String productId, {
    String languageCode = 'it',
  }) async {
    final url = baseUrl + _getCompleteProductEndpoint;
    final params = {"idPolizza": productId, "cdLingua": languageCode};
    final request = await service.request(
      url: url,
      method: Method.POST,
      params: params,
    );

    return Product.fromJson(request.data['polizza']);
  }

  Future<String> getProductAttachment(
    String attachmentId, {
    String languageCode = 'it',
  }) async {
    final url = baseUrl + _getProductAttachmentEndpoint;
    final params = {"txRifAllegato": attachmentId, "cdLingua": languageCode};
    final request = await service.request(
      url: url,
      method: Method.POST,
      params: params,
    );

    return request.data['fileAllegato'] as String;
  }
}
