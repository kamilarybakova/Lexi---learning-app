import 'package:flutter/material.dart';

import '../widgets/greeting.dart';
import '../widgets/progress_card.dart';
import '../widgets/today_training_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingSection(),
            const SizedBox(height: 20),
            ProgressCard(),
            const SizedBox(height: 20),
            TodayTrainingCard(),
          ],
        ),
      ),
    );
  }
}

