import 'package:flutter/material.dart';
import '../utils/calculator.dart';

class ResultCard extends StatelessWidget {
  final BunkResult result;

  const ResultCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: result.color,
          width: 2,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              result.color.withOpacity(0.1),
              result.color.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  result.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    result.message,
                    style: TextStyle(
                      fontSize: 16,
                      color: result.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (result.bunkDays != null && result.bunkDays! > 0) ...[
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.celebration,
                    color: result.color,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Enjoy your freedom!',
                    style: TextStyle(
                      color: result.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}