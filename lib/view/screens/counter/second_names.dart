import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_cubit.dart';
import 'package:run_app/view_model/utils/app_colors.dart';
import '../../../view_model/cubits/counter_cubit/counter_states.dart';

class SecondsNamesScreen extends StatelessWidget {
  const SecondsNamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Names', style: TextStyle(color: AppColors.white),),
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Visibility(
                    visible: CounterCubit.hossam(context).names.isNotEmpty,
                    replacement: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                            'https://lottie.host/0cbc3e43-7722-4812-927e-ddc0d4072d34/xug1oNlcWe.json',
                            height: 200,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'No Names Added Yet',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              CounterCubit.hossam(context).names[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 12,
                            ),
                        itemCount: CounterCubit.hossam(context).names.length),
                  );
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: CounterCubit.hossam(context).nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(330 / 360),
                    child: IconButton(
                      onPressed: () {
                        CounterCubit.hossam(context).addName();
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
