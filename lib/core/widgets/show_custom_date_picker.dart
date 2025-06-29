import 'package:flutter/material.dart';

Future<void> showCustomDatePicker(BuildContext context, {
  DateTime? firstDate,
  DateTime? lastDate,
  required TextEditingController controller,
  VoidCallback? onDateSelected,
  DateTime? initialDate,
}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: getInitialDate(controller: controller, initialDate: initialDate),
    firstDate: firstDate ?? DateTime(1950),
    lastDate: lastDate ?? DateTime(2100),
  );
  
  if (pickedDate != null) {
    String formattedDate = formatDate(pickedDate);
    controller.text = formattedDate;
    if (onDateSelected != null) {
      onDateSelected();
    }
  }
}

DateTime getInitialDate({
  required TextEditingController controller,
  DateTime? initialDate,
}) {
  if (controller.text.isNotEmpty) {
    try {
      return DateTime.parse(controller.text);
    } catch (e) {
      // If parsing fails, use provided initialDate or current date
    }
  }
  return initialDate ?? DateTime.now();
}

String formatDate(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-"
         "${date.month.toString().padLeft(2, '0')}-"
         "${date.day.toString().padLeft(2, '0')}";
}