import 'package:flutter/material.dart';

class AttendanceChart extends StatelessWidget {
  final double currentPercentage;
  final double requiredPercentage;

  const AttendanceChart({
    super.key,
    required this.currentPercentage,
    required this.requiredPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProgressBar('Current', currentPercentage, _getColor(currentPercentage)),
            const SizedBox(height: 16),
            _buildProgressBar('Required', requiredPercentage, Colors.blue),
            const SizedBox(height: 16),
            _buildGapIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, double value, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('${value.toStringAsFixed(2)}%'),
          ],
        ),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: Colors.grey[200],
          color: color,
        ),
      ],
    );
  }

  Widget _buildGapIndicator() {
    final gap = currentPercentage - requiredPercentage;
    return Text(
      gap >= 0
          ? '${gap.toStringAsFixed(2)}% above requirement'
          : '${gap.abs().toStringAsFixed(2)}% below requirement',
      style: TextStyle(
        color: gap >= 0 ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Color _getColor(double percentage) {
    if (percentage < 75) return Colors.red;
    if (percentage < 85) return Colors.orange;
    return Colors.green;
  }
}