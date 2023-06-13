import 'package:flutter/material.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double aspectRatio;
  final int itemCount;
  final Duration duration;

  const ImageSlider({
    super.key,
    required this.imageUrls,
    this.height = 200,
    this.aspectRatio = 16 / 9,
    this.itemCount = 1,
    this.duration = const Duration(seconds: 5),
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSlider();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startSlider() {
    Future.delayed(widget.duration, () {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _startSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 1031.43,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.fill,
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 76,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imageUrls.length,
              (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 17.94,
                  height: 17.94,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? AppColors.primary : AppColors.gray70,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
