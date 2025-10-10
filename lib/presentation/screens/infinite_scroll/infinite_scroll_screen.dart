import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const String routeName = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool _isLoading = false;
  bool _isMounted = true;

  final ScrollController _scrollController = ScrollController();

  void _addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([
      lastId + 1,
      lastId + 2,
      lastId + 3,
      lastId + 4,
      lastId + 5,
    ]);
  }

  Future<void> _loadNextPage() async {
    if (_isLoading) return;

    _isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    _addFiveImages();

    _isLoading = false;

    if (!_isMounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if ((_scrollController.position.pixels + 600) >=
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isMounted = false;

    super.dispose();
  }

  void moveScrollToBottom() {
    if (!_isMounted) return;

    if (_scrollController.position.pixels + 150 <=
        _scrollController.position.maxScrollExtent) {
      return;
    }

    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> onRefresh() async {
    _isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!_isMounted) return;

    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);

    _addFiveImages();

    _isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _ScrollListView(
        imagesIds: imagesIds,
        isLoading: _isLoading,
        isMounted: _isMounted,
        scrollController: _scrollController,
        onRefresh: onRefresh,
      ),
      floatingActionButton: _FloatingActionButtonInfiniteScroll(
        isLoading: _isLoading,
      ),
    );
  }
}

class _FloatingActionButtonInfiniteScroll extends StatelessWidget {
  const _FloatingActionButtonInfiniteScroll({required bool isLoading})
    : _isLoading = isLoading;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: _isLoading
          ? SpinPerfect(
              infinite: true,
              child: const Icon(Icons.refresh_rounded),
            )
          : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class _ScrollListView extends StatelessWidget {
  final List<int> imagesIds;
  final bool isLoading;
  final bool isMounted;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;

  const _ScrollListView({
    required this.imagesIds,
    required this.isLoading,
    required this.isMounted,
    required this.scrollController,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: RefreshIndicator(
        edgeOffset: 8.0,
        strokeWidth: 2,
        onRefresh: onRefresh,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/300/300',
              ),
            );
          },
        ),
      ),
    );
  }
}
