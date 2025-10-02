import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Search for a food',
    'Dolor ut qui fugiat deserunt esse proident.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Fast food',
    'Est nisi nulla anim laboris aliquip adipisicing.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Search for a food',
    'Aliquip mollit esse laborum consequat labore elit dolor mollit.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const String routeName = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      // print('${pageViewController.page}');

      // if (pageViewController.page == slides.length - 1) {
      //   Navigator.of(context).pop();
      // }
      final double page = pageViewController.page?.toDouble() ?? 0;

      if (!isLastPage && page >= (slides.length - 1.5)) {
        setState(() {
          isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            top: 32,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Quit"),
            ),
          ),

          isLastPage ? _LastPageControls() : const SizedBox(),
        ],
      ),
    );
  }
}

class _LastPageControls extends StatelessWidget {
  const _LastPageControls();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 32,
      child: FadeInRight(
        from: 14,
        delay: const Duration(milliseconds: 500),
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Start"),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(image: AssetImage(imageUrl)),
            ),

            const SizedBox(height: 24.0),

            Text(title, style: titleStyle),

            const SizedBox(height: 8.0),

            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
