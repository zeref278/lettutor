import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/ui/schedule/history_schedule_screen.dart';
import 'package:lettutor/ui/schedule/upcoming_schedule_screen.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with TickerProviderStateMixin {
  bool _isLoading = true;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding:  EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: defaultPrimaryColor,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: [
                Text(
                  "Up Coming",
                  style: TextStyle(fontSize: 16),
                ),
                Text("History", style: TextStyle(fontSize: 16))
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[UpComingScheduleScreen(), HistoryScheduleScreen()],
      ),
    );
  }
}
