import 'package:flutter/material.dart';

class ReusableDatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isPassword;

  ReusableDatePickerField({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  _ReusableDatePickerFieldState createState() => _ReusableDatePickerFieldState();
}

class _ReusableDatePickerFieldState extends State<ReusableDatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null) {
      setState(() {
        // Update the date controller with the selected date
        widget.controller.text = "${picked.day}-${picked.month}-${picked.year}";
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
          obscureText: widget.isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Select date",
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                await _selectDate(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
