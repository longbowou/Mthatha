import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_background.dart';
import 'card_company.dart';
import 'card_network_type.dart';
import 'validity.dart';

Color kPink = const Color(0xFFEE4CBF);
Color kRed = const Color(0xFFFA3754);
Color kBlue = const Color(0xFF4AA3F2);
Color kPurple = const Color(0xFFAF92FB);

class CreditCard extends StatelessWidget {
  var cardBackground;
  final CardNetworkType cardNetworkType;
  final CardCompany company;
  final String cardHolderName;
  final String cardNumber;
  final double roundedCornerRadius;
  final Validity validity;
  final Color numberColor;
  final Color validityColor;
  final Color cardHolderNameColor;
  final bool showChip;

  double positionY;
  double rotate;
  double opacity;
  double scale;

  bool isFlipped;
  bool isActive;
  bool isDown;

  CreditCard(
      {Key? key,
      required this.cardBackground,
      required this.cardNetworkType,
      required this.cardNumber,
      required this.cardHolderName,
      required this.company,
      required this.validity,
      this.roundedCornerRadius = 20,
      this.numberColor = Colors.white,
      this.validityColor = Colors.white,
      this.cardHolderNameColor = Colors.white,
      this.showChip = true,
      this.positionY = 0,
      this.rotate = 0,
      this.opacity = 0,
      this.scale = 0,
      this.isFlipped = false,
      this.isActive = false,
      this.isDown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: Get.width * 0.85,
      height: Get.height * 0.25,
      decoration: _buildBackground(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          company != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: company.widget,
                )
              : const SizedBox.shrink(),
          showChip ? _buildChip() : const SizedBox.shrink(),
          Column(
            children: <Widget>[
              _buildCardNumber(),
              const SizedBox(height: 4),
              _buildValidity(),
              const SizedBox(height: 4),
              _buildNameAndCardNetworkType(),
            ],
          ),
        ],
      ),
    );
  }

  _buildBackground() {
    if (cardBackground is SolidColorCardBackground) {
      SolidColorCardBackground solidColorCardBackground = cardBackground;
      return BoxDecoration(
          borderRadius: BorderRadius.circular(roundedCornerRadius),
          color: solidColorCardBackground.backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)]);
    } else if (cardBackground is GradientCardBackground) {
      GradientCardBackground gradientCardBackground = cardBackground;
      return BoxDecoration(
          borderRadius: BorderRadius.circular(roundedCornerRadius),
          gradient: gradientCardBackground.gradient,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)]);
    } else if (cardBackground is ImageCardBackground) {
      ImageCardBackground imageCardBackground = cardBackground;
      return BoxDecoration(
          borderRadius: BorderRadius.circular(roundedCornerRadius),
          image: imageCardBackground.build(),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)]);
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(roundedCornerRadius),
          color: Colors.black,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)]);
    }
  }

  _buildChip() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/chip.png',
        height: 25,
      ),
    );
  }

  _buildCardNumber() {
    if (cardNumber.trim() == "") {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        cardNumber,
        style: TextStyle(
          fontFamily: 'creditcard',
          color: numberColor,
          fontSize: 11,
        ),
      ),
    );
  }

  _buildValidity() {
    if (validity == null) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        validity.validFromMonth != null || validity.validFromYear != null
            ? Column(
                children: <Widget>[
                  Text(
                    'VALID FROM',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${validity.validFromMonth.toString().padLeft(2, '0')}/${validity.validFromYear.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 10,
                      fontFamily: 'creditcard',
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        validity.validFromMonth != null || validity.validFromYear != null ? const SizedBox(width: 24) : const SizedBox.shrink(),
        Column(
          children: <Widget>[
            Text(
              'VALID THRU',
              style: TextStyle(
                color: validityColor,
                fontSize: 8,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${validity.validThruMonth.toString().padLeft(2, '0')}/${validity.validThruYear.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: validityColor,
                fontSize: 10,
                fontFamily: 'creditcard',
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildNameAndCardNetworkType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        cardHolderName != null
            ? Expanded(
                flex: 3,
                child: AutoSizeText(
                  cardHolderName.toUpperCase(),
                  maxLines: 1,
                  minFontSize: 8,
                  style: TextStyle(
                    fontFamily: 'creditcard',
                    color: cardHolderNameColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCardNetworkType(),
        )
      ],
    );
  }

  _buildCardNetworkType() {
    if (cardNetworkType == null) {
      return const SizedBox.shrink();
    }
    return cardNetworkType.widget;
  }

  copyWith(
      {cardBackground,
      cardNetworkType,
      cardNumber,
      cardHolderName,
      company,
      validity,
      roundedCornerRadius,
      numberColor,
      validityColor,
      cardHolderNameColor,
      showChip,
      positionY,
      rotate,
      opacity,
      scale}) {
    return CreditCard(
      cardBackground: cardBackground ?? this.cardBackground,
      cardNetworkType: cardNetworkType ?? this.cardNetworkType,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      company: company ?? this.company,
      validity: validity ?? this.validity,
      numberColor: numberColor ?? this.numberColor,
      validityColor: validityColor ?? this.validityColor,
      cardHolderNameColor: cardHolderNameColor ?? this.cardHolderNameColor,
      showChip: showChip ?? this.showChip,
      positionY: positionY ?? this.positionY,
      rotate: rotate ?? this.rotate,
      opacity: opacity ?? this.opacity,
      scale: scale ?? this.scale,
    );
  }
}
