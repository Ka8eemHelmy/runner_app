abstract class NamesState {}

class InitNamesState extends NamesState {}

class AddNameState extends NamesState {}

class AddNameErrorState extends NamesState {
  String? error;
  AddNameErrorState({this.error});
}

class ClearNamesState extends NamesState {}
