import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class custom_Text extends StatelessWidget {
  String Txt;
  double Size;
  FontWeight weight;
  Color color;
  bool  theme ;



  custom_Text({Key? key,required this.Txt, required this.Size, required this.weight ,required this.color, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        Txt,
        style: GoogleFonts.poppins(
        textStyle: theme?Theme.of(context).textTheme.bodyMedium:Theme.of(context).textTheme.headline3,
    fontWeight: FontWeight.normal,
    fontSize: Size,
          color: color
    ),
      textAlign: TextAlign.center,
    );
  }
}
