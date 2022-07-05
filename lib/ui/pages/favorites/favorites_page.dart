import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Favoritos', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0
          ),
          const Center(
            child: Text('Códigos QR guardados', style: TextStyle(
              color: CustomTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0), textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10.0
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 100,
                    color: Colors.red,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                            //TODO: AQUI IRIA EL CODIGO QR GENERADO POR QR_FLUTTER QUE VA GUARDADO EN LA BASE DE DATOS
                            child: Image.asset('assets/qrcode_b.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: const [
                                Expanded(
                                  flex: 5,
                                  child: ListTile(
                                    title: Text('QR'),
                                    subtitle: Text('Código QR'),
                                  ),
                                ),
                                
                              ],
                            ),
                          )
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: CustomTheme.primaryColor,
                                  radius: 20,
                                  child: Icon(Icons.share, color: CustomTheme.whiteColor, size: 20.0),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                CircleAvatar(
                                  backgroundColor: CustomTheme.primaryColor,
                                  radius: 20,
                                  child: Icon(Icons.share, color: CustomTheme.whiteColor, size: 20.0),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}