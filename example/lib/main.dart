import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(primarySwatch: Colors.blue),
//      home: DateTesting(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Holo Datepicker Example'),
        ),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text("open picker dialog"),
            onPressed: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime(1994),
                firstDate: DateTime(1960),
                lastDate: DateTime(2012),
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: true,
                diameterRatio: 1.5,
                squeeze: 0.95,
              );

              final snackBar =
                  SnackBar(content: Text("Date Picked $datePicked"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ElevatedButton(
            child: Text("Show picker widget"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WidgetPage()));
            },
          )
        ],
      ),
    );
  }
}

class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DatePickerWidget(
              looping: false, // default is not looping
              firstDate: DateTime.now(), //DateTime(1960),
              //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
              dateFormat: "MM-dd(E)",
              //   "dd-MMMM-yyyy",
              //     locale: DatePicker.localeFromString('he'),
              onChange: (DateTime newDate, _) {
                _selectedDate = newDate;
                print(_selectedDate);
              },
              diameterRatio: 1.5,
              squeeze: 0.95,
              pickerTheme: DateTimePickerTheme(
                itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                dividerColor: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
