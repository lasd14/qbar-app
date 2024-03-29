import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

import 'dart:core';

class ButtonBrowserFavorite extends StatelessWidget {
  const ButtonBrowserFavorite({
    Key? key,
    required this.url,
  }) : super(key: key);

  final Uri url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:CustomTheme.whiteColor,
      radius: 23.0,
      child: IconButton(
        onPressed: () {

          //TODO: SE DEBE REALIZAR UNA CATEGORIA PARA LOS URL DE FORMA QUE SE PUEDA PARSEAR EL URL Y SABER QUE TIPO DE ACCION SE DEBE REALIZAR

          final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
          if (!url.toString().startsWith(RegExp(r'(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])'))) {
            final pageUrl = Uri.parse('https://$url');
            favoritesBloc.launchCode(pageUrl);
          } else {
            favoritesBloc.launchCode(url);
          }
        },
        icon: const Icon(Icons.open_in_browser, color: CustomTheme.primaryColor, size: 23.0)
        ),
    );
  }
}