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
      body: _DialogView(),
    );
  }
}

class _DialogView extends StatelessWidget {
  const _DialogView();

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text(
          "Id elit magna fugiat adipisicing adipisicing minim esse eu sit ad. Proident eu laborum incididunt id in irure cillum reprehenderit aute. Minim veniam labore elit enim cupidatat amet et. Occaecat ex ullamco sunt nostrud ex pariatur nulla nostrud quis elit. Ad tempor deserunt laboris pariatur consequat mollit.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  Text(
                    "Id elit magna fugiat adipisicing adipisicing minim esse eu sit ad. Proident eu laborum incididunt id in irure cillum reprehenderit aute. Minim veniam labore elit enim cupidatat amet et. Occaecat ex ullamco sunt nostrud ex pariatur nulla nostrud quis elit. Ad tempor deserunt laboris pariatur consequat mollit.",
                  ),
                ],
              );
            },
            child: const Text("Licenses used"),
          ),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text("Show Dialog"),
          ),
        ],
      ),
    );
  }
}
