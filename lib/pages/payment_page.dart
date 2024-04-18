import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:trip/cubit/app_cubit.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  TextEditingController amountController = TextEditingController();

  void openCheckout(amount) {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Trip App',
      'description': 'Payment for your trips',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error : $e.toString()');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint('Payment success');
    Fluttertoast.showToast(
        msg: "Payment Success: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    BlocProvider.of<AppCubit>(context).goHome();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Failure');
    Fluttertoast.showToast(
        msg: "Payment Failed: ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('Payment success');
    Fluttertoast.showToast(
        msg: "External Wallet: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<AppCubit>(context).goHome();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://media.glassdoor.com/sql/2405926/hackerkernel-squarelogo-1576847458905.png",
                height: 100,
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome to Trip App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Enter amount" : null,
                decoration: const InputDecoration(
                    hintText: "Enter Amount",
                    labelText: "Enter amount to pay ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (amountController.text.toString().isNotEmpty) {
                    setState(() {
                      int amount = int.parse(amountController.text.toString());
                      openCheckout(amount);
                      // BlocProvider.of<AppCubit>(context).goHome();
                    });
                  }
                },
                child: const Text("Pay Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
