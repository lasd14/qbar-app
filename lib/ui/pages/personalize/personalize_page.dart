import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/data/database/tables.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/pages/pages.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PersonalizePage extends StatelessWidget {
  const PersonalizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isarBloc = BlocProvider.of<IsarBloc>(context);
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    final size = MediaQuery.of(context).size;

    isarBloc.getAllFavorites();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back, color: CustomTheme.whiteColor, size: 26.00),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Selecciona un Código QR', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),),
      ),
      body: SizedBox(
        height: size.height,
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, stateFavorite) {
            return BlocBuilder<IsarBloc, IsarState>(
              builder: (context, state) {
                favoritesBloc.loadData();
                final favorites = state.favorites;
                return stateFavorite.isLoaded
                  ? GridViewQR(size: size, favoritesBloc: favoritesBloc, favorites: favorites)
                  : const CircularProgressIndicator();
              },
            );
          },
        )
      ),
    );
  }
}

class GridViewQR extends StatelessWidget {
  const GridViewQR({
    Key? key,
    required this.size,
    required this.favorites,
    required this.favoritesBloc,
  }) : super(key: key);

  final Size size;
  final List<Favorites> favorites;
  final FavoritesBloc favoritesBloc;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: favorites.length,
      padding: const EdgeInsets.all(30.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        final favorite = favorites[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const PersonalizeQrPage(),
                settings: RouteSettings(
                  arguments: favorite
                )
              )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomTheme.primaryColor,
                  CustomTheme.darkColor
                ]
              ),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                  color: Colors.grey.shade400,
                )
              ]
            ),
            margin: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              shadowColor: Colors.black54,
              color: CustomTheme.transparentColor,
              // margin: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 140,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      QrImage(
                        data: favorite.qrscan,
                        size: 90,
                        foregroundColor: CustomTheme.whiteColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(favorite.qrscan, style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.whiteColor
                      ), maxLines: 1, overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
              )
            ),
          ),
        );
      },
    );
  }
}