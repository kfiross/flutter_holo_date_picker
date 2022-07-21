import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

class DateTesting extends StatefulWidget {
  DateTesting({Key? key}) : super(key: key);

  @override
  _DateTestingState createState() => _DateTestingState();
}

class _DateTestingState extends State {
  static DateTime startDate = DateTime.now();
  String quoteStartDate =
      DateFormat.yMMMd().format(startDate.add(Duration(days: 1))).toString();
  String endPeriod = DateFormat.yMMMd()
      .format(DateTime.now().add(Duration(days: 30)))
      .toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Date Testing",
          ),
        ),
        body: ListView(
          children: [
            ElevatedButton(
              child: Text("$quoteStartDate"),
              onPressed: () async {
                var selectedFirstDate = await DatePicker.showSimpleDatePicker(
                  context,
                  initialDate: DateFormat.yMMMd().parse(quoteStartDate),
// firstDate: DateFormat.yMMMd().parse(quoteStartDate),
                  firstDate:
// startDate,
// DateTime(2020),
                      DateTime.now(),
                  lastDate: DateTime(2030),
                  dateFormat: "yyyy-MMMM-dd",
                  locale: DateTimePickerLocale.en_us,
                  looping: true,
                );

                print("My date is picked $selectedFirstDate");

                setState(() {
                  setState(() {
                    quoteStartDate =
                        DateFormat.yMMMd().format(selectedFirstDate!);

                    print("My quoteStartDate is picked $quoteStartDate");

                    endPeriod = DateFormat.yMMMd()
                        .format(selectedFirstDate.add(Duration(days: 30)))
                        .toString();
                    // oneYear = selectedFirstDate.add(Duration(days: 29));
                  });
                });
              },
            ),
            ElevatedButton(
              child: Text("$endPeriod"),
              onPressed: () async {
                var selectedEndDate = await DatePicker.showSimpleDatePicker(
                  context,
                  initialDate: DateFormat.yMMMd().parse(endPeriod),
                  firstDate: DateFormat.yMMMd()
                      .parse(endPeriod)
                      .subtract(Duration(days: 30)),
                  lastDate: DateFormat.yMMMd()
                      .parse(quoteStartDate)
                      .add(Duration(days: 30)),
                  dateFormat: "yyyy-MMMM-dd",
                  locale: DateTimePickerLocale.en_us,
                  looping: true,
                );

                setState(() {
                  endPeriod =
                      DateFormat.yMMMd().format(selectedEndDate!).toString();
                });

                print("My date is picked $selectedEndDate");
              },
            ),
          ],
        ));
  }
}
