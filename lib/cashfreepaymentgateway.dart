import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CashFreePaymentGateway extends StatefulWidget {
  const CashFreePaymentGateway({super.key});

  @override
  State<CashFreePaymentGateway> createState() => _CashFreePaymentGatewayState();
}

class _CashFreePaymentGatewayState extends State<CashFreePaymentGateway> {
  Razorpay razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);

  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          ' Razorpay Payment gateway',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: OutlinedButton(
              onPressed: () { var options = {
                'key': 'rzp_test_GcZZFDPP0jHtC4',
                'amount': 1000,
                'name': 'PALLAVI CODER',
                'description': 'Android Course',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                }
              };
              razorpay.open(options);},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.brown, minimumSize: Size(380, 50)),
              child: Text(
                "Pay 10 Rs Only",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))),
    );
  }void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(msg: "Payment Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(msg: "Payment failed");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    try {
      razorpay.clear(); // Removes all listeners
    } catch (e) {
      print(e);
    }
  }
}


