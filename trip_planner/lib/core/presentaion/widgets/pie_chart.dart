// lib/presentation/trip_details/widgets/budget_pie_chart.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/core/domain/entities/trip_entity.dart';

class BudgetPieChart extends StatefulWidget {
  final Trip trip;
  const BudgetPieChart({super.key, required this.trip});

  @override
  State<BudgetPieChart> createState() => _BudgetPieChartState();
}

class _BudgetPieChartState extends State<BudgetPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // State variables to hold calculated budget values
  double _totalSpent = 0;
  double _percentage = 0;

  bool _showPercentageInCenter = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );

    // Calculate initial budget values and start the animation
    _calculateBudgetAndAnimate();
  }

  @override
  void didUpdateWidget(BudgetPieChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the trip data has changed (e.g., a new expense was added),
    // recalculate the budget and re-run the animation.
    final newTotalSpent = widget.trip.expenses.fold<double>(
      0,
      (sum, item) => sum += item.amount,
    );

    if (newTotalSpent != _totalSpent ||
        widget.trip.budget.amount != oldWidget.trip.budget.amount) {
      _calculateBudgetAndAnimate();
    }
  }

  void _calculateBudgetAndAnimate() {
    setState(() {
      _totalSpent = widget.trip.expenses.fold(
        0,
        (sum, item) => sum + item.amount,
      );
      _percentage = (widget.trip.budget.amount > 0)
          ? (_totalSpent / widget.trip.budget.amount)
          : 0.0;
    });
    // Reset and start the animation from the beginning every time a change is detected.
    _animationController.forward(from: 0.0);
  }

  void _toggleCenterView() {
    setState(() {
      _showPercentageInCenter = !_showPercentageInCenter;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Determine the color of the progress arc based on budget usage
  Color _getProgressColor(BuildContext context) {
    if (_percentage > 1.0) return Colors.red.shade700;
    if (_percentage > 0.8) return Colors.orange.shade600;
    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    final progressColor = _getProgressColor(context);
    final remaining = widget.trip.budget.amount - _totalSpent;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            // --- The Animated Pie Chart ---
            SizedBox(
              width: 140,
              height: 140,
              child: GestureDetector(
                onTap: _toggleCenterView,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: _BudgetChartPainter(
                        percentage: _percentage,
                        animationValue: _animation.value,
                        progressColor: progressColor,
                        trackColor: Theme.of(context).colorScheme.surface,
                      ),
                      // This child is the text in the center
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                                opacity: animation,
                                child: ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                              ),
                          child: Text(
                            '${(_percentage * 100).toStringAsFixed(0)}%',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: progressColor,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 24),
            // --- The Budget Details ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatItem(
                    label: 'Spent',
                    amount: _totalSpent,
                    currency: widget.trip.budget.currency,
                    color: progressColor,
                  ),
                  const SizedBox(height: 16),
                  _StatItem(
                    label: 'Remaining',
                    amount: remaining,
                    currency: widget.trip.budget.currency,
                    color: remaining < 0
                        ? Colors.red.shade700
                        : Colors.green.shade700,
                  ),
                  const SizedBox(height: 16),
                  _StatItem(
                    label: 'Total Budget',
                    amount: widget.trip.budget.amount,
                    currency: widget.trip.budget.currency,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- The Custom Painter Class ---
class _BudgetChartPainter extends CustomPainter {
  final double percentage;
  final double animationValue;
  final Color progressColor;
  final Color trackColor;

  _BudgetChartPainter({
    required this.percentage,
    required this.animationValue,
    required this.progressColor,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const strokeWidth = 12.0;

    // --- Paint for the background track ---
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // --- Paint for the progress arc ---
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 1. Draw the full background track
    canvas.drawCircle(center, radius, trackPaint);

    // 2. Calculate the animated sweep angle
    // We use clamp to handle over-budget scenarios gracefully for drawing
    final progressAngle = 2 * pi * percentage.clamp(0.0, 1.0);
    final sweepAngle = progressAngle * animationValue;

    // 3. Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from the top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _BudgetChartPainter oldDelegate) {
    // The painter should only repaint when the animation value changes
    return animationValue != oldDelegate.animationValue;
  }
}

// Helper widget for displaying stat items
class _StatItem extends StatelessWidget {
  final String label;
  final double amount;
  final String currency;
  final Color? color;
  const _StatItem({
    required this.label,
    required this.amount,
    required this.currency,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          NumberFormat.compactCurrency(symbol: currency).format(amount),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
