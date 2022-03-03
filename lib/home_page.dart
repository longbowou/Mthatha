import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:nwt/credit_card/card_background.dart';
import 'package:nwt/credit_card/card_company.dart';
import 'package:nwt/credit_card/card_network_type.dart';
import 'package:nwt/credit_card/credit_card_widget.dart';
import 'package:nwt/credit_card/validity.dart';
import 'package:nwt/theme.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<CreditCard> _creditCards = [];

  late double _positionTop;
  late double _positionBottom;
  late double _middleAreaHeight;
  late double _outsideCardInterval;
  late double _scrollOffsetY;

  bool showIconUp = false;
  bool showIconDown = false;

  late final AnimationController _iconUpController = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _iconUpAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.0, -Get.height * 0.0005),
  ).animate(CurvedAnimation(
    parent: _iconUpController,
    curve: Curves.elasticIn,
  ));

  late final AnimationController _iconDownController = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _iconDownAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.0, Get.height * 0.0005),
  ).animate(CurvedAnimation(
    parent: _iconDownController,
    curve: Curves.elasticIn,
  ));

  late final AnimationController _iconPlusController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _iconPlusAnimation = CurvedAnimation(
    parent: _iconPlusController,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    super.initState();
    _positionTop = Get.height * 0.1;
    _positionBottom = _positionTop + Get.height * 0.27;

    _middleAreaHeight = _positionBottom - _positionTop;
    _outsideCardInterval = Get.height * 0.009;
    _scrollOffsetY = 0;

    _creditCards = [
      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.red.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'Kwami',
        cardNumber: '1234 1234 1234 1234',
        company: CardCompany.yesBank,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'Ntsugan',
        cardNumber: '1234 1234 1234 1234',
        company: CardCompany.yesBank,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
      CreditCard(
        cardBackground: SolidColorCardBackground(kRed.withOpacity(0.4)),
        cardNetworkType: CardNetworkType.mastercard,
        cardHolderName: 'Gursheesh Singh',
        cardNumber: '2434 2434 **** ****',
        company: CardCompany.kotak,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
      CreditCard(
        cardBackground: GradientCardBackground(LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kBlue, kPurple],
          stops: const [0.3, 0.95],
        )),
        cardNetworkType: CardNetworkType.mastercard,
        cardHolderName: 'Herman',
        cardNumber: '4567',
        company: CardCompany.sbiCard,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
      CreditCard(
        cardBackground: ImageCardBackground(const AssetImage('assets/images/background_sample.jpg')),
        cardNetworkType: CardNetworkType.mastercard,
        cardHolderName: 'John Doe',
        cardNumber: '2434 2434 **** ****',
        company: CardCompany.virgin,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
      CreditCard(
        cardBackground: SolidColorCardBackground(kPink.withOpacity(0.4)),
        cardNetworkType: CardNetworkType.rupay,
        cardHolderName: 'DORSOU',
        cardNumber: '2434 2434 **** ****',
        company: CardCompany.sbi,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),
    ];

    for (var i = 0; i < _creditCards.length; i++) {
      CreditCard card = _creditCards[i];

      if (i == 0) {
        card.isActive = true;
        card.positionY = _positionTop;
        card.opacity = 1;
        card.scale = 1;
        card.rotate = 1;
      } else {
        card.isDown = true;
        card.positionY = _positionBottom + (i - 1) * _outsideCardInterval;
        card.opacity = 0.8 - (i - 1) * 0.02;
        if (card.opacity < 0) card.opacity = 0.2;
        card.scale = 0.9;
        card.rotate = -60;
      }
    }
    _creditCards = _creditCards.reversed.toList();
  }

  @override
  void dispose() {
    _iconDownController.dispose();
    super.dispose();
  }

  _updateCardsPositions(double offsetY) {
    void updatePosition(CreditCard card, double firstDecoderAtAreaIdx, int index) {
      double currentDecoderAtAreaIdx = firstDecoderAtAreaIdx + index;

      if (currentDecoderAtAreaIdx <= -1) {
        card.isFlipped = true;
      } else {
        card.isFlipped = false;
      }

      if (currentDecoderAtAreaIdx == 0) {
        card.isActive = true;
      } else {
        card.isActive = false;
      }

      if (currentDecoderAtAreaIdx >= 1) {
        card.isDown = true;
      } else {
        card.isDown = false;
      }

      if (currentDecoderAtAreaIdx < 0) {
        card.positionY = _positionTop + currentDecoderAtAreaIdx * _outsideCardInterval;
        card.rotate = -90 / _outsideCardInterval * (_positionTop - card.positionY);
        if (card.rotate > 0) card.rotate = 0;
        if (card.rotate < -90) card.rotate = -90;

        card.scale = 1 - 0.2 / _outsideCardInterval * (_positionTop - card.positionY);
        if (card.scale < 0.8) card.scale = 0.8;
        if (card.scale > 1) card.scale = 1;

        card.opacity = 1 - 0.7 / _outsideCardInterval * (_positionTop - card.positionY);
        if (card.opacity < 0) card.opacity = 0;
        if (card.opacity > 1) card.opacity = 1;
      } else if (currentDecoderAtAreaIdx >= 0 && currentDecoderAtAreaIdx < 1) {
        card.positionY = _positionTop + currentDecoderAtAreaIdx * _middleAreaHeight;

        card.rotate = -60 / (_positionBottom - _positionTop) * (card.positionY - _positionTop);
        if (card.rotate > 0) card.rotate = 0;
        if (card.rotate < -60) card.rotate = -60;

        card.scale = 1 - 0.1 / (_positionBottom - _positionTop) * (card.positionY - _positionTop);
        if (card.scale < 0.9) card.scale = 0.9;
        if (card.scale > 1) card.scale = 1;

        card.opacity = 1 - 0.3 / (_positionBottom - _positionTop) * (card.positionY - _positionTop);
        if (card.opacity < 0) card.opacity = 0;
        if (card.opacity > 1) card.opacity = 1;
      } else if (currentDecoderAtAreaIdx >= 1) {
        card.positionY = _positionBottom + (currentDecoderAtAreaIdx - 1) * _outsideCardInterval;

        card.rotate = -60;
        card.scale = 0.9;
        card.opacity = 0.8 - (index + 1) * 0.02;
        if (card.opacity < 0) card.opacity = 0.2;
        if (card.opacity > 1) card.opacity = 1;
      }
    }

    _scrollOffsetY += offsetY;
    var firstDecoderAtAreaIdx = _scrollOffsetY / _middleAreaHeight;

    for (var i = 0; i < _creditCards.length; i++) {
      updatePosition(_creditCards[_creditCards.length - 1 - i], firstDecoderAtAreaIdx, i);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          widget.title,
          style: AppTheme.headline.copyWith(color: AppTheme.nearlyWhite),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppTheme.primary,
              width: Get.width,
              height: Get.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.05, top: Get.height * 0.05),
                    child: Text(
                      "Welcome back",
                      style: AppTheme.body1.copyWith(color: AppTheme.nearlyWhite),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                    child: const Divider(
                      color: AppTheme.nearlyWhite,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.05),
                      child: AutoSizeText(
                        "Kwami Ntsugan Herman DORSOU",
                        style: AppTheme.body0.copyWith(color: AppTheme.nearlyWhite),
                        maxLines: 1,
                      )),
                ],
              ),
            ),
            Expanded(
                child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                _updateCardsPositions(details.delta.dy);
              },
              onVerticalDragEnd: (DragEndDetails details) {
                _scrollOffsetY = (_scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
                if (_scrollOffsetY >= _middleAreaHeight) {
                  _scrollOffsetY = 0;
                  _scrollOffsetY = (_scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
                  if (_creditCards.length > 1) {
                    setState(() {
                      showIconUp = true;
                    });
                    Future.delayed(const Duration(milliseconds: 4500), () {
                      setState(() {
                        showIconUp = false;
                      });
                    });
                  }
                } else {
                  if (_creditCards.length > 1) {
                    setState(() {
                      showIconUp = false;
                    });
                  }
                }

                if ((_scrollOffsetY.abs() / _middleAreaHeight) >= _creditCards.length) {
                  _scrollOffsetY = -1 * (_creditCards.length - 1) * _middleAreaHeight;
                  _scrollOffsetY = (_scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
                  if (_creditCards.length > 1) {
                    setState(() {
                      showIconDown = true;
                    });
                    Future.delayed(const Duration(milliseconds: 4500), () {
                      setState(() {
                        showIconDown = false;
                      });
                    });
                  }
                } else {
                  if (_creditCards.length > 1) {
                    setState(() {
                      showIconDown = false;
                    });
                  }
                }
                _updateCardsPositions(0);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedOpacity(
                      opacity: showIconUp ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.045),
                          child: SlideTransition(
                            position: _iconUpAnimation,
                            child: Icon(
                              IconlyBold.arrow_up,
                              color: AppTheme.primary,
                              size: Get.height * 0.05,
                            ),
                          ),
                        ),
                      )),
                  Stack(alignment: Alignment.center, children: _decodersWidget()),
                  AnimatedOpacity(
                      opacity: showIconDown ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.07),
                          child: SlideTransition(
                            position: _iconDownAnimation,
                            child: Icon(
                              IconlyBold.arrow_down,
                              color: AppTheme.primary,
                              size: Get.height * 0.05,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: RotationTransition(
          turns: _iconPlusAnimation,
          child: const Icon(IconlyBold.paper_plus),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _decodersWidget() {
    List<Widget> cardsWidgets = [];
    for (var i = 0; i < _creditCards.length; i++) {
      CreditCard card = _creditCards[i];
      cardsWidgets.add(Positioned(
        top: card.positionY,
        child: Opacity(
            opacity: card.opacity,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0011)
                ..rotateX(pi / 180 * card.rotate)
                ..scale(card.scale),
              alignment: Alignment.topCenter,
              child: card,
            )),
      ));
    }
    return cardsWidgets;
  }
}
