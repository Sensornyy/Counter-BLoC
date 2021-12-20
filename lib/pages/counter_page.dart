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
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green.shade500,
                onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: Icon(Icons.add)
              ),
              FloatingActionButton(
                  backgroundColor: Colors.red.shade500,
                  onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                  child: Icon(Icons.remove)
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
                child: Icon(Icons.refresh)
              ),
            ],
          ),
        ],
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
      return const FlutterLogo(size:150);
    } else if (state is CounterLoadingState) {
      return const CircularProgressIndicator();
    } else if (state is CounterLoadedState) {
      return Text(
        "${state.counter}",
        style: Theme.of(context).textTheme.headline4,
      );
    }
    return const SizedBox.shrink();
  }
}
