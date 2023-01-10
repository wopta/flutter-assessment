import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaDocumentCard extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const FilosofiaDocumentCard({required this.name, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 100,
                child: Text(
                  name,
                  style: FilosofiaTheme.of(context)
                      .theme
                      .materialTheme
                      .textTheme
                      .bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(flex: 1),
              Icon(
                Icons.open_in_new,
                color:
                FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}