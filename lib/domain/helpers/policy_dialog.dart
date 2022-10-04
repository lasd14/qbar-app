import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class PolicyDialog extends StatelessWidget {

  PolicyDialog({
    Key? key, 
    required this.radius, 
    required this.mdFileName
  }) : assert(mdFileName.contains('.md'), 'El archivo debe contener la extension .md'), super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
      ),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 100)).then((value) {
                return rootBundle.loadString('assets/$mdFileName');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data!,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(0.0),
            color: CustomTheme.primaryColor,
            onPressed: () => Navigator.pop(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius)
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius)
                )
              ),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: const Text(
                'Cerrar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.whiteColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}