import 'package:flutter/material.dart';
import 'package:markdown_blog/main.dart';
import 'package:markdown_blog/theme/theme.dart';

class TappableItem extends StatefulWidget {
  const TappableItem({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<TappableItem> createState() => _TappableItemState();
}

class _TappableItemState extends State<TappableItem> {
  bool isHovered = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTapDown: (_) => _onTap(true),
        onTapUp: (_) => _onTap(false),
        onTapCancel: () => _onTap(false),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: (!isTapped && !isHovered)
              ? widget.child
              : ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isTapped
                        ? Colors.white
                        : isHovered
                            ? Theme.of(context).colorPalette.secondary
                            : Colors.transparent,
                    BlendMode.modulate,
                  ),
                  child: widget.child,
                ),
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }

  void _onTap(bool tap) {
    setState(() {
      isTapped = tap;
    });
  }
}
