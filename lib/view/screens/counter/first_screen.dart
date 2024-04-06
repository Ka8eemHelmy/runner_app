import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_cubit.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_states.dart';

import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Screen Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Screen'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                print(state);
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
                SizedBox(
                  width: 12,
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if(state is AddCounterState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Incremented'),
                        duration: Duration(milliseconds: 800),
                      ));
                    }
                  },
                  builder:(context, state) {
                    return Visibility(
                      visible: CounterCubit.hossam(context).counter > 0,
                      child: FloatingActionButton(
                        onPressed: () {
                          CounterCubit.hossam(context).minusCounter();
                        },
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: Text('Go To Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
