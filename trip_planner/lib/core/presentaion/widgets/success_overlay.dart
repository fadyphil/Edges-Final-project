// lib/presentation/widgets/success_overlay.dart
import 'package:flutter/material.dart';

class SuccessOverlay extends StatefulWidget {
  final String message;
  const SuccessOverlay({super.key, this.message = 'Saved!'});

  @override
  State<SuccessOverlay> createState() => _SuccessOverlayState();
}

class _SuccessOverlayState extends State<SuccessOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: .5),
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _iconAnimation,
                  builder: (context, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) => SweepGradient(
                        colors: [Colors.green, Colors.greenAccent],
                        stops: [_iconAnimation.value, _iconAnimation.value],
                        transform: const GradientRotation(3.14 / 2),
                      ).createShader(bounds),
                      child: child,
                    );
                  },
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.message,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper function to show the overlay
void showSuccessOverlay(BuildContext context, {String message = 'Saved!'}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => SuccessOverlay(message: message),
  );

  overlay.insert(overlayEntry);

  // Remove the overlay after a short duration
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
