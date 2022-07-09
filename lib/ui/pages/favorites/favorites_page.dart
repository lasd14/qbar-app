import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

import 'widgets/button_browserfavorite.dart';
import 'widgets/button_sharefavorite.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final isarBloc = BlocProvider.of<IsarBloc>(context);
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);

    isarBloc.getAllFavorites();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: CustomTheme.whiteColor, size: 26.0),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favoritos',
          style: TextStyle(
              color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Center(
            child: Text(
              'Códigos QR Favoritos',
              style: TextStyle(
                  color: CustomTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: BlocBuilder<IsarBloc, IsarState>(
              builder: (context, state) {
                final favorites = state.favorites;
                return ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    final favorite = favorites[index];
                    final parseUrl = Uri.parse(favorite.qrscan);
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0, left: 12.0, right: 12.0, bottom: 6.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: CustomTheme.secondaryColor),
                          child: Row(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                                  child: favoritesBloc.getDataCode(favorite.qrscan)
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ListTile(
                                        title: const Text(
                                          'QR',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: CustomTheme.whiteColor),
                                        ),
                                        subtitle: Text(
                                          favorite.qrscan,
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: CustomTheme.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ButtonBrowserFavorite(url: parseUrl),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        const ButtonShareFavorite(),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}