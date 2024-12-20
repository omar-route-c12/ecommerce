import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final bool isFavorite;

  const HeartButton({required this.onTap, this.isFavorite = false});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late bool isClicked;

  @override
  void initState() {
    super.initState();
    isClicked = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
        widget.onTap?.call();
      },
      child: ImageIcon(
        AssetImage(isClicked ? IconsAssets.clickedHeart : IconsAssets.heart),
        color: isClicked ? Colors.red : Colors.grey,
      ),
    );
  }
}
