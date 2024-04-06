import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'names_state.dart';

class NamesCubit extends Cubit<NamesState> {
  NamesCubit() : super(InitNamesState());

  static NamesCubit get(context) => BlocProvider.of<NamesCubit>(context);

  List<String> names = [];

  TextEditingController nameController = TextEditingController();

  void addName() {
    if (nameController.text.trim().isNotEmpty) {
      names.add(nameController.text.trim());
      nameController.clear();
      emit(AddNameState());
    } else {
      emit(
        AddNameErrorState(
          error: 'Please, Enter a Valid Name',
        ),
      );
    }
  }

  void clearNames() {
    names.clear();
    emit(ClearNamesState());
  }
}
