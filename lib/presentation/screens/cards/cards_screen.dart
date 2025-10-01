import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "elevation 0.0"},
  {"elevation": 1.0, "label": "elevation 1.0"},
  {"elevation": 2.0, "label": "elevation 2.0"},
  {"elevation": 3.0, "label": "elevation 3.0"},
  {"elevation": 4.0, "label": "elevation 4.0"},
  {"elevation": 5.0, "label": "elevation 5.0"},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  static const String routeName = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) {
            return _CardType1(
              elevation: card["elevation"],
              label: card["label"],
            );
          }),

          ...cards.map((card) {
            return _CardType2(
              elevation: card["elevation"],
              label: card["label"],
            );
          }),

          ...cards.map((card) {
            return _CardType3(
              elevation: card["elevation"],
              label: card["label"],
            );
          }),

          ...cards.map((card) {
            return _CardType4(
              elevation: card["elevation"],
              label: card["label"],
            );
          }),

          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4, 0, 4),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4, 0, 4),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outlined'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.onSurface.withValues(alpha: 0.1),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4, 0, 4),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/350",
            height: 350,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
