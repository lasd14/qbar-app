import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonBrowserFavorite extends StatelessWidget {
  const ButtonBrowserFavorite({
    Key? key,
    required this.url,
  }) : super(key: key);

  final Uri url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:CustomTheme.primaryColor,
      radius: 23.0,
      child: IconButton(
        onPressed: () {
          final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
          favoritesBloc.launchCode(url);
        },
        icon: const Icon(Icons.open_in_browser, color: CustomTheme.whiteColor, size: 23.0)
        ),
    );
  }
}