import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showCustomMonthYearPicker({
  required BuildContext context,
  required Function(DateTime) onSelected,
}) async {

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  DateTime selectedDate = DateTime.now();
  int selectedYear = selectedDate.year;
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => setState(() => selectedYear--),
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                CustomText(
                  text: '$selectedYear',
                  fontWeight: FontWeight.bold,
                  fontsize: 22.sp,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    setState(() => selectedYear++);
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      // _selectedMonth(_months[index]);
                      onSelected( DateTime(selectedYear, index+1));
                    },
                    title: CustomText(
                      text: months[index],
                      fontsize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: months.length,
              ),
            ),
          );
        },
      );
    },
  );
}