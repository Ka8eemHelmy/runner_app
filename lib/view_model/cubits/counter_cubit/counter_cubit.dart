import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_states.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(InitCounterState());

  static CounterCubit hossam (context) {
    return BlocProvider.of<CounterCubit>(context);
  }

  List<String> names = [];

  TextEditingController nameController = TextEditingController();

  void addName() {
    names.add(nameController.text);
    nameController.clear();
    emit(AddNameState());
  }

  void resetNames() {
    names.clear();
    emit(ResetNamesState());
  }

  int counter = 0;

  void addCounter(){
    // Handle Data
    counter++;
    // Send State to UI
    emit(AddCounterState());
  }

  void minusCounter() {
    counter--;
    emit(MinusCounterState());
  }
}