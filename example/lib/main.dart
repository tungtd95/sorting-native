import 'package:flutter/material.dart';
import 'package:sorting_native/sorting_native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> sorted = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      sorted = await SortingNative.sort(
        [1, 10, 2, 3, 4, 2, 9, 6, 15, 20, 8, 2],
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sorting in native'),
        ),
        body: Center(
          child: Text(sorted.join(' ')),
        ),
      ),
    );
  }
}
