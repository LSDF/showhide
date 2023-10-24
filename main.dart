import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class ShowWidgetStateNotifier extends StateNotifier<bool> {
  ShowWidgetStateNotifier() : super(false);

  void showWidget() {
    state = !state;
  }
}

final Provider = StateNotifierProvider<ShowWidgetStateNotifier, bool>((ref) {
  return ShowWidgetStateNotifier();
});

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Visiblity'),
            actions: [
              IconButton(
                  onPressed: () {
                    ref.read(Provider.notifier).showWidget();
                  },
                  icon: Icon(Icons.access_time_outlined))
            ],
          ),
          body: Consumer(
            builder: (context, ref, child) {
              final s = ref.watch(Provider);
              return Visibility(visible: s, child: Sg());
            },
          )),
    );
  }
}

class Sg extends ConsumerStatefulWidget {
  const Sg({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SgState();
}

class _SgState extends ConsumerState<Sg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      color: Colors.black,
    );
  }
}
