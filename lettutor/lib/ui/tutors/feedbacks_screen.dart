import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:provider/provider.dart';


class FeedbacksScreen extends StatefulWidget {

  final String tutorId;
  const FeedbacksScreen({Key? key, required this.tutorId}) : super(key: key);

  @override
  State<FeedbacksScreen> createState() => _FeedbacksScreenState();
}

class _FeedbacksScreenState extends State<FeedbacksScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<TutorProvider>(context, listen: false)
        .fetchTutorInfo(widget.tutorId)
        .then((tutor) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Consumer<TutorProvider>(
          builder: (context, tutorData, _) {
            return Text('Feedbacks for ${tutorData.tutor.name}');
          },
        ),

        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        backgroundColor: defaultPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        elevation: 5,
        child: Icon(CupertinoIcons.add, color: Colors.black,),
        backgroundColor: defaultPrimaryColor,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Consumer<TutorProvider>(
          builder: (context, tutorData, _) {
            return tutorData.tutor.feedbacks!.isEmpty ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Icon(CupertinoIcons.text_quote,
                    color: Colors.red, size: 40),
                SizedBox(width: 10),
                Text(
                  'Empty',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
                // Text(
                //   tutorData.tutor.name,
                //   style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       color: Colors.red,
                //       fontSize: 20),
                // )
              ],
            ):
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: tutorData.tutor.feedbacks!.length,
              itemBuilder: (context, int index) {
                return Column(
                  children: [
                    CustomCardFeedback(feedback: tutorData.tutor.feedbacks![index]),
                    SizedBox(height: 15,)
                  ],
                );
              },

            );
          },
        ),

      ),
    );
  }
}
