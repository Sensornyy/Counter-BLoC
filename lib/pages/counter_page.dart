import 'package:bloc_study/counter_page_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: _CounterText(),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    if (state is CounterInitialState) {
      return const FlutterLogo(size: 150);
    } else if (state is CounterLoadedState) {
      return Scaffold(
        backgroundColor: const Color(0xFFFFA883),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF57D49),
          centerTitle: true,
          title: Text(
            'Counter BLoC',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFF57D49),
            onPressed: () =>
                context.read<CounterBloc>().add(CounterResetEvent()),
            child: Icon(Icons.refresh)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tap '-' to Decrement",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
                ),
                margin: const EdgeInsets.all(10),
                height: 50,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.black54),
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterDecrementEvent());
                      },
                    ),
                    Text(
                      "${state.counter}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.black54),
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterIncrementEvent());
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                "Tap '+' to Increment",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
