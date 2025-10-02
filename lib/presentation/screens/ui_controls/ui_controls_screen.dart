import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  const UIControlsScreen({super.key});

  static const String routeName = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, bus, train, plane }

class _UIControlsViewState extends State<_UIControlsView> {
  bool _developerMode = false;
  Transportation? selectedTransportation = Transportation.car;

  bool _wantsBreakfast = false;
  bool _wantsLunch = false;
  bool _wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: _developerMode,
          onChanged: (value) {
            setState(() {
              _developerMode = !_developerMode;
            });
          },
          title: Text("Developer mode"),
          subtitle: Text("Enables developer mode"),
        ),

        ExpansionTile(
          title: const Text("Radio Transportation"),
          subtitle: Text(
            selectedTransportation?.name ?? "Select a transportation",
          ),
          children: [
            _RadioTransportation(selectedTransportation, (value) {
              setState(() {
                selectedTransportation = value;
              });
            }),
          ],
        ),

        _CheckboxListTile(
          wantsBreakfast: _wantsBreakfast,
          wantsLunch: _wantsLunch,
          wantsDinner: _wantsDinner,
          onChangedWantsBreakfast: (value) {
            setState(() {
              _wantsBreakfast = value ?? false;
            });
          },
          onChangedWantsLunch: (value) {
            setState(() {
              _wantsLunch = value ?? false;
            });
          },
          onChangedWantsDinner: (value) {
            setState(() {
              _wantsDinner = value ?? false;
            });
          },
        ),
      ],
    );
  }
}

class _RadioTransportation extends StatelessWidget {
  final Transportation? selectedTransportation;
  final Function(Transportation? transportation) onChanged;

  const _RadioTransportation(this.selectedTransportation, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return RadioGroup<Transportation>(
      groupValue: selectedTransportation,
      onChanged: onChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RadioListTile<Transportation>(
            title: Text(Transportation.car.name),
            subtitle: const Text("Travel by car"),
            value: Transportation.car,
          ),
          RadioListTile<Transportation>(
            title: Text(Transportation.bus.name),
            subtitle: const Text("Travel by bus"),
            value: Transportation.bus,
          ),
          RadioListTile<Transportation>(
            title: Text(Transportation.train.name),
            subtitle: const Text("Travel by train"),
            value: Transportation.train,
          ),
          RadioListTile<Transportation>(
            title: Text(Transportation.plane.name),
            subtitle: const Text("Travel by plane"),
            value: Transportation.plane,
          ),
        ],
      ),
    );
  }
}

class _CheckboxListTile extends StatelessWidget {
  final bool wantsBreakfast;
  final bool wantsLunch;
  final bool wantsDinner;

  final Function(bool?) onChangedWantsBreakfast;
  final Function(bool?) onChangedWantsLunch;
  final Function(bool?) onChangedWantsDinner;

  const _CheckboxListTile({
    required this.wantsBreakfast,
    required this.wantsLunch,
    required this.wantsDinner,
    required this.onChangedWantsBreakfast,
    required this.onChangedWantsLunch,
    required this.onChangedWantsDinner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: wantsBreakfast,
          onChanged: onChangedWantsBreakfast,
          title: const Text("Do you want breakfast?"),
          subtitle: const Text("Breakfast is good for you"),
        ),

        CheckboxListTile(
          value: wantsLunch,
          onChanged: onChangedWantsLunch,
          title: const Text("Do you want lunch?"),
          subtitle: const Text("Lunch is good for you"),
        ),

        CheckboxListTile(
          value: wantsDinner,
          onChanged: onChangedWantsDinner,
          title: const Text("Do you want dinner?"),
          subtitle: const Text("Dinner is good for you"),
        ),
      ],
    );
  }
}
