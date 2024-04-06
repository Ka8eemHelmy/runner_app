import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:run_app/view_model/cubits/names_cubit/names_cubit.dart';
import 'package:run_app/view_model/cubits/names_cubit/names_state.dart';
import 'package:run_app/view_model/utils/app_colors.dart';
import 'second_names.dart';

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Names', style: TextStyle(color: AppColors.white),),
        actions: [
          IconButton(
            onPressed: () {
              NamesCubit.get(context).clearNames();
            },
            icon: Icon(
              Icons.cleaning_services_rounded,
              color: AppColors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondsNamesScreen(),
                ),
              );
            },
            icon: Hero(
              tag: 'kareem',
              child: Icon(
                Icons.telegram,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<NamesCubit, NamesState>(
                listenWhen: (previous, current) {
                  return current is AddNameErrorState;
                },
                listener: (context, state) {
                  if(state is AddNameErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error ?? 'Error Occurred'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                buildWhen: (previous, current) {
                  return current is AddNameState || current is ClearNamesState;
                },
                builder: (context, state) {
                  NamesCubit cubit = NamesCubit.get(context);
                  return Visibility(
                    visible: cubit.names.isNotEmpty,
                    replacement: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                            'https://lottie.host/3a6bbe55-37be-4f37-b555-d1cfafb6c979/FkjuqDLnes.json',
                            // 'https://lottie.host/0cbc3e43-7722-4812-927e-ddc0d4072d34/xug1oNlcWe.json',
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
                              cubit.names[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 12,
                            ),
                        itemCount: cubit.names.length),
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
                      controller: NamesCubit.get(context).nameController,
                      onFieldSubmitted: (value) {
                        NamesCubit.get(context).addName();
                      },
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
                        NamesCubit.get(context).addName();
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
