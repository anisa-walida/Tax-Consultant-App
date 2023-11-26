import 'package:flutter/material.dart';

class ReusableTimePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;

  ReusableTimePickerField({
    required this.controller,
    required this.labelText,
    required this.icon,
  });

  @override
  _ReusableTimePickerFieldState createState() => _ReusableTimePickerFieldState();
}

class _ReusableTimePickerFieldState extends State<ReusableTimePickerField> {
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        // Update the time controller with the selected time
        widget.controller.text = "${picked.hour}:${picked.minute}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.brown,
            ),
            SizedBox(width: 10),
            Text(
              widget.labelText,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        TextField(
          readOnly: true,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Select time",
            suffixIcon: IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () async {
                await _selectTime(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
