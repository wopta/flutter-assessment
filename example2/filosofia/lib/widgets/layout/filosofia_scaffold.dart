import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool isConstrained;

  const FilosofiaScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.isConstrained = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      body: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: const Center(
          child: FilosofiaCircularIndicator(),
        ),
        child: isConstrained
            ? FilosofiaConstrainedBox(
                child: FilosofiaSafeArea(
                  color: FilosofiaTheme.of(context)
                      .theme
                      .materialTheme
                      .primaryColor,
                  child: body,
                ),
              )
            : FilosofiaSafeArea(
                color:
                    FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
                child: body,
              ),
      ),
    );
  }
}
