import 'package:daily_planner/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, required this.onAddTask});

  final void Function(TaskModel task) onAddTask;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _title = TextEditingController();
  final _context = TextEditingController();
  final _place = TextEditingController();
  final _hoster = TextEditingController();
  final _description = TextEditingController();
  DateTime? _selectedStart = DateTime.now();
  DateTime? _selectedEnd;
  Status _selectedStatus = Status.created;

  void _datePickerStart() async {
    final now = DateTime.now();
    final previousDate = DateTime(now.year - 5, now.month, now.day);
    final futureDate = DateTime(now.year + 2, now.month, now.day);

    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: previousDate,
      lastDate: futureDate,
    );

    setState(() {
      _selectedStart = pickDate;
    });
  }

  void _datePickerEnd() async {
    final now = DateTime.now();
    final previousDate = DateTime(now.year - 5, now.month, now.day);
    final futureDate = DateTime(now.year + 2, now.month, now.day);

    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: previousDate,
      lastDate: futureDate,
    );

    setState(() {
      _selectedEnd = pickDate;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            title: const Text('Some input is going wrong !!!'),
            content: const Text(
                'Plase make that you have input all the plank in need for the task information'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'),
              ),
            ],
          );
        });
  }

  void _saveDataTask() {
    if (_title.text.trim().isEmpty ||
        _context.text.trim().isEmpty ||
        _place.text.trim().isEmpty ||
        _hoster.text.trim().isEmpty ||
        _selectedEnd == null) {
      return _showDialog();
    }
    widget.onAddTask(
      TaskModel(
        title: _title.text,
        context: _context.text,
        timeStart: _selectedStart!,
        timeEnd: _selectedEnd!,
        place: _place.text,
        hoster: _hoster.text,
        description: _description.text,
        status: _selectedStatus,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _title.dispose();
    _context.dispose();
    _place.dispose();
    _hoster.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 70),
          child: Column(
            children: [
              TextFormField(
                controller: _title,
                maxLength: 50,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _context,
                decoration: const InputDecoration(
                  label: Text('Context'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            _selectedStart == null
                                ? "No date Selected"
                                : formatMatter.format(_selectedStart!),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: _datePickerStart,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            _selectedEnd == null
                                ? "Selected Date"
                                : formatMatter.format(_selectedEnd!),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: _datePickerEnd,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _place,
                          decoration: const InputDecoration(
                            label: Text('Place'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _hoster,
                          decoration: const InputDecoration(
                            label: Text('Hoster'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Description'),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(fontSize: 20),
                ),
                controller: _description,
                minLines: 1,
                maxLines: 10,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                      value: _selectedStatus,
                      items: Status.values
                          .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status.name.toUpperCase())))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedStatus = value;
                        });
                      }),
                  const SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: _saveDataTask,
                    child: const Text('Save task'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
