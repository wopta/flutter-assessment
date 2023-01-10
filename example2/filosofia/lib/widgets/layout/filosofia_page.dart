import 'package:flutter/material.dart';

abstract class FilosofiaPage extends StatelessWidget {
  abstract final List<Widget>? actions;
  abstract final Widget? drawer;

  const FilosofiaPage({super.key});
}
