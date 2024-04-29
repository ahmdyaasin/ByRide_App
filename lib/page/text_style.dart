import 'package:byride_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle ts = GoogleFonts.poppins(
  fontSize: 14,
  color: textWhite,
);

class DisplayLarge extends StatelessWidget {
  const DisplayLarge({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 32, fontWeight: FontWeight.w600));
  }
}

class DisplayMedium extends StatelessWidget {
  const DisplayMedium({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 18, fontWeight: FontWeight.w600));
  }
}

class DisplaySmall extends StatelessWidget {
  const DisplaySmall({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 16, fontWeight: FontWeight.w700));
  }
}

class BodyLarge extends StatelessWidget {
  const BodyLarge({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color, fontSize: 16, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BodyMedium extends StatelessWidget {
  const BodyMedium({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 14, fontWeight: FontWeight.w600),overflow:TextOverflow.ellipsis);
  }
}

class BodySmall extends StatelessWidget {
  const BodySmall({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 14, fontWeight: FontWeight.w600));
  }
}

class SubheadLarge extends StatelessWidget {
  const SubheadLarge({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 12, fontWeight: FontWeight.w700));
  }
}

class SubheadSmall extends StatelessWidget {
  const SubheadSmall({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 12, fontWeight: FontWeight.w600));
  }
}

class Caption extends StatelessWidget {
  const Caption({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color, fontSize: 12, fontWeight: FontWeight.normal),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class CaptionP extends StatelessWidget {
  const CaptionP({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.justify
        );
  }
}

class TitleMain extends StatelessWidget {
  const TitleMain(
      {super.key, required this.title1, required this.title2, this.titleColor});
  final String title1;
  final String title2;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: title1,
              style: GoogleFonts.poppins(
                  color: titleColor ?? textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: title2,
              style: GoogleFonts.poppins(
                  color: titleColor ?? textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class WidgetText extends StatelessWidget {
  const WidgetText({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: color, fontSize: 20, fontWeight: FontWeight.w600));
  }
}

class WidgetText2 extends StatelessWidget {
  const WidgetText2(
      {super.key,
      required this.title1,
      required this.title2,
      required this.color});
  final String title1;
  final String title2;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: title1,
              style: GoogleFonts.poppins(
                  color: color, fontSize: 20, fontWeight: FontWeight.w600)),
          TextSpan(
              text: title2,
              style: GoogleFonts.poppins(
                  color: color, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
