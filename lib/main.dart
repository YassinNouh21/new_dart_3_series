import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // title: Text(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                switch(state){
                 case  CounterInitial():
                      return const Text(
                        'What is the state of the current Counter Cubit : CounterInitial',
                      );
                  case CounterIncrement():
                    return const Text(
                      'What is the state of the current Counter Cubit : CounterIncrement',
                    );
                  case CounterDecrement():
                    return const Text(
                      'What is the state of the current Counter Cubit : CounterDecrement',
                    );
                }
              },
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.value}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context
            .read<CounterCubit>()
            .increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
