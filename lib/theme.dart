import 'package:flutter/material.dart';
import 'package:nwt/gen/fonts.gen.dart';

class AppTheme {
  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.18,
    color: blueText,
  );

  static const TextStyle disabledTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.18,
    color: grey_400,
  );

  static const TextStyle appBarTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.18,
    color: blueText,
  );

  static const TextStyle errorTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.18,
    color: danger,
  );

  static const TextStyle primaryTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.18,
    color: primary,
  );
  static const TextStyle greenTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.18,
    color: green,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle body0 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle body0Disabled = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: -0.05,
    color: grey_400,
  );

  static const TextStyle body0Error = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: -0.05,
    color: danger,
  );

  static const TextStyle body1Gray = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: grey_400,
  );

  static const TextStyle link = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: -0.05,
    color: secondary,
  );

  static const TextStyle body1Error = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: danger,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle helper = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: grey_400, // was lightText
  );

  static const TextStyle error = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: danger, // was lightText
  );

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color nearlyWhite1 = Color(0xFFFEFEFE);
  static const Color eagleGreen = Color(0xFFe6e6ea);
  static const Color almond = Color(0xFFFFC847);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color grey_300 = Color(0xFFE4E6EF);
  static const Color grey_400 = Color(0xFFB5B5C3);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color blueText = Color(0xFF2E4053);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color danger = Color(0xFFdc3545);
  static const Color primary = Color(primaryMainColor);
  static const Color secondary = Color(0xFFffbe0b);
  static const Color green = Color(0xFF006C67);
  static const Color lightGreen = Color(0xFF00B8AE);
  static const String fontName = FontFamily.lufga;

  static const MaterialColor primaryColor = MaterialColor(
    primaryMainColor,
    <int, Color>{
      50: Color(0xFF87BBFE),
      100: Color(0xFF6FADFE),
      200: Color(0xFF58A0FE),
      300: Color(0xFF4092FE),
      400: Color(0xFF2885FE),
      500: Color(0xFF1077FE),
      600: Color(0xFF016BF4),
      700: Color(0xFF0160DC),
      800: Color(0xFF0156C4),
      900: Color(primaryMainColor),
    },
  );
  static const int primaryMainColor = 0xFF014AAB;

  static ThemeData theme = ThemeData(
      fontFamily: fontName,
      canvasColor: nearlyWhite,
      cardColor: nearlyWhite,
      brightness: Brightness.light,
      primarySwatch: primaryColor,
      splashColor: primaryColor,
      textTheme: textTheme,
      platform: TargetPlatform.iOS,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      primaryColor: primaryColor,
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color(0xfff0f1f5),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          labelStyle: TextStyle(color: AppTheme.darkGrey, fontWeight: FontWeight.bold, fontSize: 15)),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: const StadiumBorder())),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        shape: StadiumBorder(),
      ));
}
