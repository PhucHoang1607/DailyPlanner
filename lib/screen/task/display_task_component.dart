import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/screen/task/task_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:daily_planner/provider/const.dart';

class DisplayTaskComponent extends StatelessWidget {
  const DisplayTaskComponent(this.taskModel, {super.key});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(taskModel.place),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        statusIcon[taskModel.status]!['icon'] as IconData,
                        color: statusIcon[taskModel.status]!['color'] as Color,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(taskModel.status == Status.created ||
                              taskModel.status == Status.process
                          ? taskModel.formattedStartMDY
                          : taskModel.formattedEndMDY)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (page) =>
                TaskDetail(id: taskModel.id, taskModel: taskModel)));
      },
      //() {
      //   showDialog(
      //       context: context,
      //       builder: (ctx) {
      //         return AlertDialog(
      //           title: const Text('Navigator'),
      //           content: const Text(
      //               'This action will navigate you to detail Screen'),
      //           actions: <Widget>[
      //             TextButton(
      //               style: TextButton.styleFrom(
      //                 textStyle: Theme.of(context).textTheme.labelLarge,
      //               ),
      //               child: const Text('OK'),
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //             ),
      //           ],
      //         );
      //       });
      // },
    );
  }
}
