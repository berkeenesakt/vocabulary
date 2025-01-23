import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gen/gen.dart';
import 'package:vocabulary/feature/home/view/widgets/word_card.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/navigation/app_router.dart';
import 'package:vocabulary/product/service/word_service.dart';

part 'mixin/home_view_mixin.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  final CardSwiperController controller = CardSwiperController();
  List<WordModel> words = [];

  @override
  void initState() {
    super.initState();
    _fetchInitialWords();
  }

  Future<void> _fetchInitialWords() async {
    try {
      await Future.wait([
        _fetchWord(),
        _fetchWord(),
        _fetchWord(),
      ]);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch words')),
        );
      }
    }
  }

  Future<void> _fetchWord() async {
    try {
      final word = await WordService.fetchWord();
      setState(() {
        words.add(word);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch word')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: words.length < 3
          ? const Center(child: CircularProgressIndicator())
          : CardSwiper(
              controller: controller,
              cardsCount: words.length,
              onSwipe: (previousIndex, currentIndex, direction) {
                _fetchWord();
                return true;
              },
              cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) =>
                  WordCard(word: words[index]),
            ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Vocabulary'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: logout,
        ),
      ],
    );
  }
}
