import 'package:flutter/material.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/utils.dart';
import 'package:get/get.dart';

/// A full-width widget for user select date range. Used on filter page such as [ReleaseEventSearchFilterPage].
class DateRangeInput extends StatefulWidget {
  final DateTime fromDateValue;

  final DateTime toDateValue;

  final ValueChanged onFromDateChanged;

  final ValueChanged onToDateChanged;

  const DateRangeInput(
      {@required this.onFromDateChanged,
      @required this.onToDateChanged,
      this.fromDateValue,
      this.toDateValue})
      : assert(onFromDateChanged != null),
        assert(onToDateChanged != null);

  @override
  _DateRangeInputState createState() => _DateRangeInputState();
}

class _DateRangeInputState extends State<DateRangeInput> {
  DateTime fromDate;

  DateTime toDate;

  @override
  void initState() {
    fromDate = widget.fromDateValue;
    toDate = widget.toDateValue;
    super.initState();
  }

  void _updateFromDate(DateTime value) {
    setState(() => this.fromDate = value);
    widget.onFromDateChanged(value);
  }

  void _updateToDate(DateTime value) {
    setState(() => this.toDate = value);
    widget.onToDateChanged(value);
  }

  void _onPressFromDate() {
    showDatePicker(
            context: this.context,
            initialDate: (fromDate == null) ? DateTime.now() : fromDate,
            firstDate: DateTime(2005),
            lastDate: DateTime(2030))
        .then(_updateFromDate);
  }

  void _onPressToDate() {
    showDatePicker(
            context: this.context,
            initialDate: (toDate == null) ? DateTime.now() : toDate,
            firstDate: DateTime(2005),
            lastDate: DateTime(2030))
        .then((_updateToDate));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('date'.tr),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: RaisedButton.icon(
                      color: Theme.of(context).cardColor,
                      icon: Icon(Icons.calendar_today),
                      label: Text((fromDate == null)
                          ? 'from'.tr
                          : DateTimeUtils.toSimpleFormat(fromDate)),
                      onPressed: _onPressFromDate),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('-'),
                ),
                Expanded(
                  child: RaisedButton.icon(
                      color: Theme.of(context).cardColor,
                      icon: Icon(Icons.calendar_today),
                      label: Text((toDate == null)
                          ? 'to'.tr
                          : DateTimeUtils.toSimpleFormat(toDate)),
                      onPressed: _onPressToDate),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
