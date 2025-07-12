import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../utils/calculator.dart';
import '../widgets/result_card.dart';
import '../widgets/attendance_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _totalDaysController = TextEditingController();
  final TextEditingController _daysPassedController = TextEditingController();
  final TextEditingController _presentController = TextEditingController();
  final TextEditingController _absentController = TextEditingController();
  final TextEditingController _desiredPercentController = TextEditingController();
  
  BunkResult? _result;
  bool _isLoading = false;

  @override
  void dispose() {
    _totalDaysController.dispose();
    _daysPassedController.dispose();
    _presentController.dispose();
    _absentController.dispose();
    _desiredPercentController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(milliseconds: 300), () {
      try {
        final result = calculateBunkDays(
          totalDays: _totalDaysController.text,
          daysPassed: _daysPassedController.text,
          present: _presentController.text,
          absent: _absentController.text,
          desiredPercent: _desiredPercentController.text,
        );
        setState(() {
          _result = result;
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _result = BunkResult(
            e.toString(),
            Colors.redAccent,
            '❌',
            currentPercentage: 0,
          );
          _isLoading = false;
        });
      }
    });
  }

  void _resetFields() {
    setState(() {
      _totalDaysController.clear();
      _daysPassedController.clear();
      _presentController.clear();
      _absentController.clear();
      _desiredPercentController.clear();
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bunk Master'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfoDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    InputField(
                      label: 'Total Days in Semester',
                      controller: _totalDaysController,
                      icon: Icons.calendar_today,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      label: 'Days Passed So Far',
                      controller: _daysPassedController,
                      icon: Icons.today,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      label: 'Days Present',
                      controller: _presentController,
                      icon: Icons.check_circle,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      label: 'Days Absent',
                      controller: _absentController,
                      icon: Icons.cancel,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      label: 'Desired %',
                      controller: _desiredPercentController,
                      icon: Icons.percent,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _calculate,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const Text('Calculate'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: _resetFields,
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (_result != null) ...[
              const SizedBox(height: 16),
              ResultCard(result: _result!),
              AttendanceChart(
                currentPercentage: _result!.currentPercentage,
                requiredPercentage: double.tryParse(_desiredPercentController.text) ?? 75,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('How to Use'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Total Days: Duration of your semester'),
            Text('• Days Passed: Classes held so far'),
            Text('• Present/Absent: Your attendance in held classes'),
            Text('• Desired %: Minimum attendance percentage needed'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}