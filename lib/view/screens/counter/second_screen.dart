import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_cubit.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_states.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Second Screen'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(CounterCubit.hossam(context).counter.toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.hossam(context).addCounter();
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 12,),
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.hossam(context).minusCounter();
                  },
                  child: Text('-', style: TextStyle(fontSize: 30),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
