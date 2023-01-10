import 'package:extensions/extensions.dart';
import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:wopta/product/data/product_repository.dart';
import 'package:wopta/widgets/internal_accordion_widget.dart';

import '../../data/model/basic_product/asset_dto.dart';
import '../../data/model/basic_product/guarantee_dto.dart';
import '../../data/model/complete_product/guarantee_parameter.dart';
import '../../data/model/complete_product/product.dart';
import '../../data/model/complete_product/product_annex.dart';

class PolicyDetail extends StatelessWidget {
  final String productId;

  const PolicyDetail({required this.productId, Key? key}) : super(key: key);

  String getProductExpiryDate(Product product) {
    var expiryDate = '';
    String formattedDate = DateFormat('dd/MM/yyyy').format(product.expiryDate);
    expiryDate = "Scadenza: $formattedDate";
    return expiryDate;
  }

  Widget getProductIcon(Product product, BuildContext context) {
    Widget productIcon;
    if (product.isBusinessInsurance()) {
      productIcon = SvgPicture.asset(
        "assets/icons/business-insurance.svg",
        width: FilosofiaTheme.of(context).spacing.lg,
      );
    } else {
      productIcon = SvgPicture.asset(
        "assets/icons/personal-insurance.svg",
        width: FilosofiaTheme.of(context).spacing.lg,
      );
    }
    return productIcon;
  }

  @override
  Widget build(BuildContext context) {
    return FilosofiaScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        centerTitle: true,
        title: const Text('Dettaglio polizza'),
      ),
      body: FutureBuilder<Product>(
        future: context.read<ProductRepository>().fetchProduct(productId),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data!;
            final premioLordoFormatted = MoneyFormatter(
                    amount: product.contract.nImpLordoAnnuo!,
                    settings: MoneyFormatterSettings(symbol: '€'))
                .output;
            return SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: FilosofiaTheme.of(context).spacing.md_lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      FilosofiaTheme.of(context).spacing.sm_md,
                                ),
                                child: getProductIcon(product, context),
                              ),
                              Text(
                                'Polizza ${product.policyNumber}',
                                style: FilosofiaTheme.of(context)
                                    .theme
                                    .materialTheme
                                    .textTheme
                                    .headline3,
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Text(
                          'Premio: ${premioLordoFormatted.symbolOnRight}',
                          style:
                              FilosofiaTheme.of(context).textTheme.subtitleMd,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Text(
                          getProductExpiryDate(product),
                          style:
                              FilosofiaTheme.of(context).textTheme.subtitleMd,
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Text(
                          'Hai assicurato',
                          style: FilosofiaTheme.of(context)
                              .theme
                              .materialTheme
                              .textTheme
                              .headline4,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
                ...product.assets!
                    .map(
                      (AssetDto asset) => Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                              FilosofiaTheme.of(context).spacing.md,
                            ),
                            child: AssetDetail(asset: asset),
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                    .toList(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: product.attachments != null &&
                          product.attachments!.isNotEmpty
                      ? AttachmentsContainer(
                          attachments: product.attachments!,
                          productId: productId,
                        )
                      : Container(),
                ),
              ]),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: FilosofiaCircularIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class AssetDetail extends StatelessWidget {
  final AssetDto asset;

  const AssetDetail({required this.asset, Key? key}) : super(key: key);

  String _getAssetType() {
    switch (asset.txTipoBene) {
      case 'GENERICO':
        return "Impresa";
      case 'UBICAZIONE':
        return "Fabbricato ${asset.location?.indirizzo?.txDescIndirizzo ?? ''}"
            .toTitleCase();
      case 'ASSICURATO':
        return asset.insuredPerson == null
            ? 'Persona'
            : '${asset.insuredPerson?.registry.name} ${asset.insuredPerson?.registry.surname}'
                .toTitleCase();
      default:
        return "";
    }
  }

  Widget _getAssetIcon(BuildContext context) {
    switch (asset.txTipoBene) {
      case 'GENERICO':
        return Icon(
          Icons.business_outlined,
          color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
        );
      case 'UBICAZIONE':
        return Icon(
          Icons.factory_outlined,
          color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
        );
      case 'ASSICURATO':
        return Icon(
          Icons.person_outline,
          color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
        );
      default:
        return Container();
    }
  }

  Widget _getGuaranteeContent(context, GuaranteeDto guarantee) {
    final parameters = guarantee.getFomattedParameters();
    return SizedBox(
      width: double.infinity,
      child: parameters != null && parameters.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: parameters
                  .map(
                    (GuaranteeParameter parameter) => RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${parameter.txParametro!.toTitleCase()}: ',
                            style: FilosofiaTheme.of(context)
                                .theme
                                .materialTheme
                                .textTheme
                                .headline6,
                          ),
                          TextSpan(
                            text: parameter.txValoreParametro!.toTitleCase(),
                            style: FilosofiaTheme.of(context)
                                .theme
                                .materialTheme
                                .textTheme
                                .bodyText1,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          : const Text("La garanzia non prevede franchigia e scoperto"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final assetType = _getAssetType();
    final assetIcon = _getAssetIcon(context);
    return asset.elencoGaranzie != null
        ? FilosofiaBoxShadow(
            child: InternalAccordionWidget(
              contentBorderColor: Colors.transparent,
              contentBackgroundColor: Colors.transparent,
              headerBackgroundColor: Colors.white,
              header: Row(
                children: [
                  assetIcon,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: FilosofiaTheme.of(context).spacing.sm,
                      ),
                      child: Text(
                        assetType,
                        style: FilosofiaTheme.of(context)
                            .theme
                            .materialTheme
                            .textTheme
                            .headline5,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: asset.elencoGaranzie!
                    .map(
                      (e) => InternalAccordionWidget(
                        rightIconColor: Colors.white,
                        header: Text(
                          '${e.txGaranzia}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: _getGuaranteeContent(context, e),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        : Container();
  }
}

class AttachmentsContainer extends StatelessWidget {
  final String productId;
  final List<ProductAnnex> attachments;

  const AttachmentsContainer(
      {required this.attachments, required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Documenti',
            style: FilosofiaTheme.of(context)
                .theme
                .materialTheme
                .textTheme
                .headline4,
          ),
        ),
        ...attachments
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: FilosofiaDocumentCard(
                  name: e.txNomeAllegato!,
                  onTap: () {
                    context.goNamed(
                      'document',
                      params: <String, String>{
                        'productId': productId,
                      },
                      queryParams: <String, String>{
                        'documentId': e.txRifIdAllegato!,
                        'documentName': e.txNomeAllegato!,
                      },
                    );
                  },
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
