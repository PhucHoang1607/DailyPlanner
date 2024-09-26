import 'package:daily_planner/model/task_model.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.id, required this.taskModel});

  late String id;
  late TaskModel taskModel;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _title;
  late TextEditingController _context;
  late TextEditingController _place;
  late TextEditingController _hoster;
  late TextEditingController _description;
  DateTime? _selectedStart = DateTime.now();
  DateTime? _selectedEnd;
  Status _selectedStatus = Status.created;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = TextEditingController(text: widget.taskModel.title);
    _context = TextEditingController(text: widget.taskModel.context);
    _place = TextEditingController(text: widget.taskModel.place);
    _hoster = TextEditingController(text: widget.taskModel.hoster);
    _description = TextEditingController(text: widget.taskModel.description);
    _selectedStart = widget.taskModel.timeStart;
    _selectedEnd = widget.taskModel.timeEnd;
    _selectedStatus = widget.taskModel.status;
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
    return LayoutBuilder(builder: (ctx, constraints) {
      final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 70),
          child: Form(
            key: _formKey,
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                      onPressed: _saveDataFix,
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
        ),
      );
    });
  }

  //Function
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
    final futureDate = DateTime(now.year + 5, now.month, now.day);
    final pickDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: previousDate,
        lastDate: futureDate);
    setState(() {
      _selectedEnd = pickDate;
    });
  }

  void _saveDataFix() {
    if (_formKey.currentState!.validate()) {
      widget.taskModel.title = _title.text;
      widget.taskModel.context = _context.text;
      widget.taskModel.place = _place.text;
      widget.taskModel.hoster = _hoster.text;
      widget.taskModel.description = _description.text;
      widget.taskModel.timeStart = _selectedStart!;
      widget.taskModel.timeEnd = _selectedEnd!;
      widget.taskModel.status = _selectedStatus;
    }
    Navigator.pop(context, widget.taskModel);
  }
}
