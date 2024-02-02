import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight fontWeight;
  TextAlign textAlign;

  SmallText(
      {Key? key,
        this.color = const Color(0xFFccc7c5),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.height = 1.2,
        this.fontWeight = FontWeight.normal,
        this.textAlign = TextAlign.center,
        this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 50,
      textAlign: textAlign,
      style:
      GoogleFonts.poppins(
          textStyle:
          TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: size,
            height: height,
          )
      ),
    );
  }
}
