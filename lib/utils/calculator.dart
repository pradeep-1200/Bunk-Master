import 'package:flutter/material.dart';
import 'dart:math';

class BunkResult {
  final String message;
  final Color color;
  final String emoji;
  final double? bunkDays;
  final double currentPercentage;

  BunkResult(
    this.message,
    this.color,
    this.emoji, {
    this.bunkDays,
    required this.currentPercentage,
  });
}

BunkResult calculateBunkDays({
  required String totalDays,
  required String daysPassed,
  required String present,
  required String absent,
  required String desiredPercent,
}) {
  // Parse inputs
  final Y = double.tryParse(totalDays.trim()) ?? 0;
  final D = double.tryParse(daysPassed.trim()) ?? 0;
  final P = double.tryParse(present.trim()) ?? 0;
  final A = double.tryParse(absent.trim()) ?? 0;
  final percent = double.tryParse(desiredPercent.trim()) ?? 75.0;

  // Validations
  if (Y <= 0) throw ArgumentError('Total days must be positive');
  if (D <= 0 || D > Y) throw ArgumentError('Invalid days passed');
  if (P < 0 || A < 0) throw ArgumentError('Attendance cannot be negative');
  if (P + A > D) throw ArgumentError('Present + absent cannot exceed days passed');
  if (percent < 0 || percent > 100) throw ArgumentError('Invalid percentage');

  // Calculations
  final currentPercentage = (P / D) * 100;
  final remainingDays = Y - D;
  final totalRequired = Y * (percent / 100);
  final remainingNeeded = max(0, totalRequired - P);
  final safeBunks = max(0, remainingDays - remainingNeeded);

  // Result determination
  if (currentPercentage < percent && D == Y) {
    return BunkResult(
      'Final attendance too low! (${currentPercentage.toStringAsFixed(2)}%)',
      Colors.redAccent,
      '😬',
      currentPercentage: currentPercentage,
    );
  } else if (safeBunks <= 0) {
    return BunkResult(
      remainingNeeded > 0
          ? 'Need to attend ${remainingNeeded.toStringAsFixed(1)} of remaining $remainingDays days'
          : 'No more bunks possible! Current: ${currentPercentage.toStringAsFixed(2)}%',
      Colors.orange,
      '⚠️',
      currentPercentage: currentPercentage,
    );
  } else {
    return BunkResult(
      'You can bunk ${safeBunks.toStringAsFixed(1)} of remaining $remainingDays days',
      Colors.greenAccent,
      '😎',
      bunkDays: safeBunks.toDouble(),
      currentPercentage: currentPercentage,
    );
  }
}