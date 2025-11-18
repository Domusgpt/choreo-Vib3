import 'package:flutter/material.dart';

class CollapsedPill extends StatelessWidget {
  final VoidCallback onExpand;
  final VoidCallback onPlayPause;

  const CollapsedPill({
    super.key,
    required this.onExpand,
    required this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < -5) onExpand();
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFF00FFFF),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00FFFF).withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.tune, color: Color(0xFF00FF00)),
              onPressed: onExpand,
            ),
            IconButton(
              icon: const Icon(Icons.play_circle, color: Color(0xFF00FFFF)),
              iconSize: 40,
              onPressed: onPlayPause,
            ),
            const Icon(Icons.graphic_eq, color: Color(0xFFFF00FF)),
          ],
        ),
      ),
    );
  }
}
