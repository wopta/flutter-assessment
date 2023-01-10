import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaAppBar extends AppBar {
  final String? titleText;
  @override
  final Widget? title;
  @override
  final Widget? leading;
  @override
  final List<Widget>? actions;

  FilosofiaAppBar(
      {this.title, this.leading, this.titleText, this.actions, Key? key})
      : assert(titleText != null || title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title ??
          Text(
            titleText!,
            style: FilosofiaTheme.of(context).textTheme.appBarTitle,
          ),
      centerTitle: true,
      actions: actions,
    );
  }
}
