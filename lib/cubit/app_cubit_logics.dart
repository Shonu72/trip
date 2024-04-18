import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/navpages/main_page.dart';
import 'package:trip/pages/details_page.dart';
import 'package:trip/pages/payment_page.dart';
import 'package:trip/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is DetailedState) {
            return const DetailsPage();
          }
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is PaymentState) {
            return const PaymentPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
