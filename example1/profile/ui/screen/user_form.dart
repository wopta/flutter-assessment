import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wopta/authentication/ui/model/app_user_model.dart';

/// chiamato da Profile
class UserForm extends StatefulWidget {
  final AppUserModel user;

  const UserForm({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle2;
    final color = Theme.of(context).colorScheme.primary;
    // Build a Form widget using the _formKey created above.
    return ResponsiveGridList(
      horizontalGridSpacing: 6,
      // Horizontal space between grid items
      verticalGridSpacing: 16,
      // Vertical space between grid items
      horizontalGridMargin: 8,
      // Horizontal space around the grid
      verticalGridMargin: 30,
      // Vertical space around the grid
      minItemWidth: 300,
      // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow: 1,
      // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow: 3,
      // The maximum items to show in a single row. Can be useful on large screens
      shrinkWrap: true,
      // shrinkWrap property of the ListView.builder()
      children: [
        FilosofiaBoxShadow(
          child: Padding(
            padding: EdgeInsets.all(FilosofiaTheme.of(context).spacing.sm),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/icons/user01_128.png',
                    height: 50,
                    color: FilosofiaTheme.of(context)
                        .theme
                        .materialTheme
                        .primaryColor,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text('Nome: ${widget.user.name}',
                              style: textStyle)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text('Cognome: ${widget.user.surname}',
                              style: textStyle)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                              'Codice fiscale: ${widget.user.fiscalCode}',
                              style: textStyle)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FilosofiaBoxShadow(
          child: Padding(
            padding: EdgeInsets.all(FilosofiaTheme.of(context).spacing.sm),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/icons/profile_128.png',
                    height: 50,
                    color: FilosofiaTheme.of(context)
                        .theme
                        .materialTheme
                        .primaryColor,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                            'Indirizzo: ${widget.user.address}',
                            style: textStyle,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          'Mail: ${widget.user.email}',
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        for (var business in widget.user.businesses)
          FilosofiaBoxShadow(
            child: Padding(
              padding: EdgeInsets.all(FilosofiaTheme.of(context).spacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'assets/icons/buildings_128.png',
                      height: 50,
                      color: FilosofiaTheme.of(context)
                          .theme
                          .materialTheme
                          .primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Text('Azienda: ${business.name}',
                                style: textStyle)),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Text('Partita iva: ${business.vatCode}',
                                style: textStyle))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
