import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonShareFavorite extends StatelessWidget {
  const ButtonShareFavorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:CustomTheme.whiteColor,
      radius: 23.0,
      child: IconButton(
        onPressed: () {
          final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
          favoritesBloc.shareScreenshotQr();
        },
        icon: const Icon(Icons.share, color: CustomTheme.primaryColor, size: 23.0)
      ),
    );
  }
}