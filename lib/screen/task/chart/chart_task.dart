import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/screen/task/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChartTask extends StatelessWidget {
  const ChartTask({super.key, required this.taskModel});

  final List<TaskModel> taskModel;

  List<TaskChartCount> get countTask {
    return [
      TaskChartCount.forCountStatus(taskModel, Status.created),
      TaskChartCount.forCountStatus(taskModel, Status.process),
      TaskChartCount.forCountStatus(taskModel, Status.excellent),
      TaskChartCount.forCountStatus(taskModel, Status.done),
    ];
  }

  double get maxCountStatus {
    double maxCountStatus = 0;
    for (final task in countTask) {
      if (task.totalStatus > maxCountStatus) {
        maxCountStatus = task.totalStatus;
      }
    }
    return maxCountStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.1)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final task in countTask)
                  ChartBar(
                    fill: task.totalStatus == 0
                        ? 0
                        : task.totalStatus / maxCountStatus,
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: countTask
                .map(
                  (task) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        statusIcon[task.status]!['icon'] as IconData,
                        color: statusIcon[task.status]!['color'] as Color,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
