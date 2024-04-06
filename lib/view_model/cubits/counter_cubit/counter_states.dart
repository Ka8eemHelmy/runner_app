abstract class CounterState {}

class InitCounterState extends CounterState{
  InitCounterState(){
    print('Init Counter State is Fired');
  }
}

class AddCounterState extends CounterState{}

class MinusCounterState extends CounterState {}

class AddNameState extends CounterState {}

class ResetNamesState extends CounterState {}