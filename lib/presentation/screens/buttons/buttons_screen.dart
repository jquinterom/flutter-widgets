import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String routeName = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),

            const ElevatedButton(onPressed: null, child: Text('Disabled')),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),

            FilledButton(onPressed: () {}, child: const Text("Filled")),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ios_share_rounded),
              label: Text("Filled Icon"),
            ),

            OutlinedButton(onPressed: () {}, child: Text("Outlined")),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share_rounded),
              label: Text("Outlined Icon"),
            ),

            TextButton(onPressed: () {}, child: Text("Text Button")),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.iso_rounded),
              label: const Text("Text Icon Button"),
            ),

            const _CustomButton(),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ios_share_sharp),
            ),

            IconButton(
              onPressed: null,
              icon: const Icon(Icons.ios_share_sharp),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(colors.onSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Custom button",
              style: TextStyle(color: colors.onSecondary),
            ),
          ),
        ),
      ),
    );
  }
}
