import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const String routeName = 'snackbar_screen';

  static final _snackBar = SnackBar(
    content: const Text("Hello Snackbar"),
    action: SnackBarAction(label: "OK", onPressed: () {}),
    duration: Duration(seconds: 2),
  );

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar and Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSnackBar(context),
        label: const Text("Show Snackbar"),
        icon: const Icon(Icons.info_outline),
      ),
    );
  }
}
