import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final isarBloc = BlocProvider.of<IsarBloc>(context);

    isarBloc.getAllFavorites();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: CustomTheme.whiteColor, size: 26.00),
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
              'Códigos QR guardados',
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
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: CustomTheme.lightColor),
                          child: Row(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10.0, bottom: 10.0),
                                  //TODO: AQUI IRIA EL CODIGO QR GENERADO POR QR_FLUTTER QUE VA GUARDADO EN LA BASE DE DATOS
                                  child: Image.asset('assets/qrcode_b.png'),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor:
                                              CustomTheme.primaryColor,
                                          radius: 23.0,
                                          child: Icon(Icons.copy,
                                              color: CustomTheme.whiteColor,
                                              size: 23.0),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        CircleAvatar(
                                          backgroundColor:
                                              CustomTheme.primaryColor,
                                          radius: 23.0,
                                          child: Icon(Icons.share,
                                              color: CustomTheme.whiteColor,
                                              size: 23.0),
                                        ),
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
