part of 'app_cubit.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailedState extends CubitState {
  DetailedState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}

class PaymentState extends CubitState {
  PaymentState();
  @override
  List<Object> get props => [];
}
