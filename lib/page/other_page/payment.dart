import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/page/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _groupValuep = -1;
  List<PaymentType> payment = [
    PaymentType('FPX Online Banking', icon: 'assets/img/payment/fpx.png'),
    PaymentType('Credit / Debit Card', icon: 'assets/img/payment/card.png'),
    PaymentType('DuitNow QR Pay', icon: 'assets/img/payment/duit-now.png'),
    PaymentType('JomPay', icon: 'assets/img/payment/JomPay.png'),
    PaymentType('Touch n Go E-Wallet', icon: 'assets/img/payment/tng.png'),
    PaymentType('GrabPay', icon: 'assets/img/payment/grabpay.png'),
    PaymentType('ShoppePay', icon: 'assets/img/payment/shoppepay.png'),
    PaymentType('Boost E-Wallet', icon: 'assets/img/payment/boost.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: primaryColor,
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const PhosphorIcon(
                          PhosphorIconsRegular.caretLeft,
                          color: textWhite,
                        )),
                    Expanded(
                      child: Text('Payment Details',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: textWhite)),
                    ),
                    Container()
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 8),
                            child: Column(
                              children: [
                                TitleMain(title1: 'Payment', title2: ' Method'),
                                Caption(
                                    text: 'Choose Payment Method',
                                    color: textGrey)
                              ],
                            ),
                          ),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: payment.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RadioListTile(
                                        // hoverColor: primaryColor,
                                        activeColor: primaryColor,
                                        selectedTileColor:
                                            primaryColorLow.withOpacity(1),
                                        selected: index == _groupValuep
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        title: Row(
                                          children: [
                                            Image.asset(
                                              payment[index].icon,
                                              width: 60,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                                child: BodyMedium(
                                                    text: payment[index].name,
                                                    color: index == _groupValuep
                                                        ? primaryColor
                                                        : textDark))
                                          ],
                                        ),
                                        value: index,
                                        groupValue: _groupValuep,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _groupValuep = newValue!;
                                          });
                                        }),
                                    const Divider(
                                      height: 0,
                                    ),
                                  ],
                                );
                              }),
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 12),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Vehicle Owner Will Be Notified Soon',
                              onConfirmBtnTap: () {
                                context.go('/homePageUser');
                              },
                            );
                            ;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 10, 26, 55),
                                    Color.fromARGB(216, 10, 26, 55),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: Center(
                              child: Text(
                                'Pay Now',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: textWhite),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Caption(
                            text: 'Make Sure all information is complete',
                            color: textGrey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentType {
  final String icon;
  final String name;
  PaymentType(this.name, {required this.icon});
}
