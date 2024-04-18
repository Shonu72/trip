import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip/model/data_model.dart';
import 'package:trip/services/data_services.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit({required this.data}) : super(InitialState()) {
    // here we emit the WelcomeState means when the app starts it will show the welcome screen after initial state
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailedState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
