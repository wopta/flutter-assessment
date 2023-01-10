import 'package:filosofia/theme/filosofia_theme.dart';
import 'package:filosofia/widgets/dialogs/filosofia_box_shadow.dart';
import 'package:flutter/material.dart';

class FilosofiaProductCard extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final String subtitle;
  final void Function() onTap;

  const FilosofiaProductCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: FilosofiaTheme.of(context).spacing.sm_md,
        vertical: FilosofiaTheme.of(context).spacing.sm,
      ),
      child: InkWell(
        onTap: onTap,
        child: FilosofiaBoxShadow(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: FilosofiaTheme.of(context).spacing.sm_md,
              vertical: FilosofiaTheme.of(context).spacing.sm,
            ),
            child: ListTile(
              leading: icon,
              title: title,
              subtitle: Text(subtitle),
            ),
          ),
        ),
      ),
    );
  }
}
