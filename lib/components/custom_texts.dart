import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSizes {
  static double get h1 => 48.sp;

  static double get h2 => 40.sp;

  static double get h3 => 32.sp;

  static double get h4 => 24.sp;

  static double get h5 => 20.sp;

  static double get h6 => 18.sp;

  static double get b1 => 18.sp;

  static double get b2 => 16.sp;

  static double get b3 => 14.sp;

  static double get b4 => 12.sp;

  static double get b5 => 10.sp;
}

class TextWeight {
  static FontWeight get regular => FontWeight.w300;

  static FontWeight get medium => FontWeight.w500;

  static FontWeight get semiBold => FontWeight.w600;

  static FontWeight get bold => FontWeight.w700;
}

class TextColor {
  static Color get grayscale900 => const Color(0xFF212121);

  static Color get grayscale800 => const Color(0xFF424242);

  static Color get grayscale700 => const Color(0xFF616161);

  static Color get grayscale600 => const Color(0xFF757575);

  static Color get grayscale500 => const Color(0xFF9E9E9E);

  static Color get grayscale400 => const Color(0xFFBDBDBD);

  static Color get grayscale300 => const Color(0xFFE0E0E0);

  static Color get grayscale200 => const Color(0xFFEEEEEE);

  static Color get grayscale100 => const Color(0xFFF5F5F5);

  static Color get grayscale50 => const Color(0xFFFAFAFA);

  static Color get white => const Color(0xFFFFFFFF);
}

class Heading1Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;

  const Heading1Text(this.text,
      { this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: FontSizes.h1,
          color: color ?? TextColor.grayscale900,
          fontWeight: weight ?? TextWeight.medium),
    );
  }
}

class Heading2Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const Heading2Text(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: FontSizes.h2,
          color: color ?? TextColor.grayscale900,
          fontWeight: weight ?? TextWeight.medium),
    );
  }
}

class Heading3Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const Heading3Text(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: TextOverflow.clip,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
            fontSize: FontSizes.h3,
            color: color ?? TextColor.grayscale900,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class Heading4Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const Heading4Text(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: FontSizes.h4,
          color: color ?? TextColor.grayscale900,
          fontWeight: weight ?? TextWeight.medium),
    );
  }
}

class Heading5Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const Heading5Text(this.text,
      {Key? key, this.textAlign, this.maxLines, this.weight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: FontSizes.h5,
          color: color ?? TextColor.grayscale900,
          fontWeight: weight ?? TextWeight.medium),
    );
  }
}

class Heading6Text extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const Heading6Text(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: FontSizes.h6,
          color: color ?? TextColor.grayscale900,
          fontWeight: weight ?? TextWeight.medium),
    );
  }
}

class BodyExtraLargeText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const BodyExtraLargeText(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.clip,
      maxLines: maxLines,
      style: TextStyle(
              fontSize: FontSizes.b1,
              color: color ?? TextColor.grayscale900,
              fontWeight: weight ?? TextWeight.medium)
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const BodyLargeText(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: FontSizes.b2,
            color: color ?? TextColor.grayscale900,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const BodyMediumText(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: FontSizes.b3,
            color: color ?? TextColor.grayscale900,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodySmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const BodySmallText(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines,
        overflow: TextOverflow.clip,
        style: TextStyle(
            fontSize: FontSizes.b4,
            color: color ?? TextColor.grayscale900,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodyExtraSmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;

  final FontWeight? weight;
  final Color? color;

  const BodyExtraSmallText(this.text,
      {this.textAlign, this.maxLines, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: FontSizes.b5,
            color: color ?? TextColor.grayscale900,
            fontWeight: weight ?? TextWeight.medium));
  }
}
