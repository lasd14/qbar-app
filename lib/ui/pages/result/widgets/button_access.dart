import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonAccess extends StatelessWidget {
  const ButtonAccess({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.url,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String text;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 35.0,
          child: IconButton(
            onPressed: () {
              final scanBloc = BlocProvider.of<ScanBloc>(context);
              scanBloc.launchCode(url);
            },
            icon: Icon(icon, color: CustomTheme.whiteColor, size: 35.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(text, style: const TextStyle(
          color: CustomTheme.blackColor,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center,)
      ],
    );
  }
}