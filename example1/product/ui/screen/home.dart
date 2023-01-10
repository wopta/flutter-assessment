import 'package:carousel_slider/carousel_slider.dart';
import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:network/network.dart';
import 'package:widgets/wopta_video_player.dart';
import 'package:wopta/product/ui/bloc/product_bloc.dart';
import 'package:wopta/product/ui/bloc/product_event.dart';
import 'package:wopta/product/ui/bloc/product_state.dart';

import '../../data/model/basic_product/product_dto.dart';

class Home extends FilosofiaPage {
  @override
  final List<Widget>? actions;
  @override
  final Widget? drawer;

  Home({
    this.actions,
    this.drawer,
    Key? key,
  }) : super(key: key);

  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return FilosofiaScaffold(
      appBar: AppBar(
        title: Text(
          'Le mie polizze',
          style: FilosofiaTheme.of(context).textTheme.appBarTitle,
        ),
        centerTitle: true,
        actions: actions,
      ),
      drawer: drawer,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final products = state.products;
          final itemCount = (state is ProductInLoad ||
                  state is ProductInitialized ||
                  state is ProductsEmpty)
              ? 2
              : products.length + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: RefreshIndicator(
              onRefresh: () async =>
                  context.read<ProductBloc>().add(RefreshedProduct()),
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return buildCarouselSlider(carouselController);
                  }
                  if (state is ProductInLoad || state is ProductInitialized) {
                    return const FilosofiaCircularIndicator();
                  }
                  if (state is ProductsEmpty) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Non hai ancora le polizze',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return createProductView(products[index - 1], context);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  CarouselSlider buildCarouselSlider(CarouselController carouselController) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (_, CarouselPageChangedReason reason) {
          if (!carouselController.ready) return;
          if (reason != CarouselPageChangedReason.manual) return;
          carouselController.startAutoPlay();
        },
        height: 250.0,
        viewportFraction: 1.0,
      ),
      items: [
        showVideoFromFirebase('videos/carousel/video1.mp4'),
        showVideoFromFirebase('videos/carousel/video2.mp4'),
        showVideoFromFirebase('videos/carousel/video3.mp4'),
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: i,
            );
          },
        );
      }).toList(),
    );
  }

  Widget showVideoFromFirebase(String path) => FutureBuilder(
        future: FirebaseStorage.instance.ref(path).getDownloadURL(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return WoptaVideoPlayer(
              showControls: true,
              videoUrl: snapshot.requireData,
              onVideoStarted: () {
                if (!carouselController.ready) return;
                carouselController.stopAutoPlay();
              },
              onVideoEnded: () {
                if (!carouselController.ready) return;
                carouselController.startAutoPlay();
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          // skip if no video available
          carouselController.nextPage();
          return Container();
        },
      );

  Widget createProductView(ProductDto product, BuildContext context) {
    return productsList(product, context);
  }

  Widget productsList(ProductDto product, BuildContext context) {
    final dataScadenza = getProductExpiryDate(product);
    final productIcon = getProductIcon(product, context);
    final productName = getProductTitle(product, context);
    final productSubtitle = '${product.numeroPolizza} - $dataScadenza';

    return FilosofiaProductCard(
      icon: productIcon,
      title: productName,
      subtitle: productSubtitle,
      onTap: () {
        context.goNamed(
          'product',
          params: <String, String>{'productId': product.idPolizza.toString()},
        );
      },
    );
  }

  String getProductExpiryDate(ProductDto product) {
    var expiryDate = '';
    if (product.dataScadenza != null) {
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(product.dataScadenza!);
      expiryDate = "Scadenza: $formattedDate";
    }
    return expiryDate;
  }

  Widget getProductIcon(ProductDto product, BuildContext context) {
    Widget productIcon;
    if (product.isBusinessInsurance()) {
      productIcon = SvgPicture.asset(
        "assets/icons/business-insurance.svg",
        width: FilosofiaTheme.of(context).spacing.xl,
      );
    } else {
      productIcon = SvgPicture.asset(
        "assets/icons/personal-insurance.svg",
        width: FilosofiaTheme.of(context).spacing.xl,
      );
    }
    return productIcon;
  }

  Widget getProductTitle(ProductDto product, BuildContext context) {
    Widget productTitle;
    if (product.isBusinessInsurance()) {
      productTitle = RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: 'Wopta per te\n',
              style: FilosofiaTheme.of(context).textTheme.cardTitleMd,
            ),
            TextSpan(
              text: 'Artigiani & Imprese',
              style: FilosofiaTheme.of(context).textTheme.cardSubtitleSmMd,
            ),
          ],
        ),
      );
    } else {
      productTitle = RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: 'Wopta per te\n',
              style: FilosofiaTheme.of(context).textTheme.cardTitleMd,
            ),
            TextSpan(
              text: 'Persona',
              style: FilosofiaTheme.of(context).textTheme.cardSubtitleSmMd,
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: FilosofiaTheme.of(context).spacing.sm),
      child: productTitle,
    );
  }
}
