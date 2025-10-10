import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});
  static const String routeName = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          RadioGroup(
            groupValue: colors[selectedColor],
            child: Column(
              children: [
                ...colors.map(
                  (color) => RadioListTile(
                    value: color,
                    title: Text('This color', style: TextStyle(color: color)),
                    subtitle: Text('${color.toARGB32()}'),
                    activeColor: color,
                  ),
                ),
              ],
            ),
            onChanged: (value) {
              if (value == null) return;

              ref.read(selectedColorProvider.notifier).state = colors.indexOf(
                value,
              );
            },
          ),
        ],
      ),
    );
  }
}
