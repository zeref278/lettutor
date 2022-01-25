import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class FeedbacksScreen extends StatefulWidget {
  final String tutorId;
  const FeedbacksScreen({Key? key, required this.tutorId}) : super(key: key);

  @override
  State<FeedbacksScreen> createState() => _FeedbacksScreenState();
}

class _FeedbacksScreenState extends State<FeedbacksScreen> {
  bool _isLoading = true;
  double _rating = 0;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Consumer<TutorProvider>(
          builder: (context, tutorData, _) {
            return Text(
                '${AppLocalizations.of(context).translate(LanguageKey.feedbacks_for)} ${tutorData.tutor.name}');
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
      floatingActionButton: Consumer<TutorProvider>(
        builder: (context, tutorData, _) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      title: Text(
                        "${AppLocalizations.of(context).translate(LanguageKey.review)} ${tutorData.tutor.name}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomRatingBar(
                            rating: _rating,
                            onRatingUpdate: (double _r) {
                              setState(() {
                                _rating = _r;
                              });
                            },
                            isReadonly: false,
                            isAllowHalfStar: false,
                            sizeOfStar: 40,
                          ),
                          SizedBox(height: 25),
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: TextField(
                                maxLines: 4,
                                controller: _controller,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.teal),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hoverColor: defaultPrimaryColor,
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    labelText: AppLocalizations.of(context)
                                        .translate(LanguageKey.content),
                                    hintText: AppLocalizations.of(context)
                                        .translate(
                                            LanguageKey.reivew_tutor_here)),
                              )),
                        ],
                      ),
                      actions: [
                        MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                _controller.clear();
                                _rating = 0;
                              });
                            },
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: CustomText(
                              LanguageKey.cancel,
                              context,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                        Consumer<ScheduleProvider>(
                          builder: (context, scheduleData, _) {
                            return MaterialButton(
                                onPressed: () {
                                  tutorData.reviewTutor(
                                      scheduleData.getScheduleIdByTutorId(
                                          tutorData.tutor.id),
                                      tutorData.tutor.id,
                                      _rating.toInt().toString(),
                                      _controller.text);
                                  Navigator.pop(context);
                                },
                                color: defaultPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: CustomText(
                                  LanguageKey.send,
                                  context,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ));
                          },
                        )
                      ],
                    );
                  });
            },
            elevation: 5,
            child: Icon(
              CupertinoIcons.add,
              color: Colors.black,
            ),
            backgroundColor: defaultPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Consumer<TutorProvider>(
                builder: (context, tutorData, _) {
                  return tutorData.tutor.feedbacks!.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
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
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: tutorData.tutor.feedbacks!.length,
                          itemBuilder: (context, int index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          '${tutorData.tutor.feedbacks!.length} ${AppLocalizations.of(context).translate(LanguageKey.review)}',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : Container(),
                                CustomCardFeedback(
                                    feedback:
                                        tutorData.tutor.feedbacks![index]),
                                SizedBox(
                                  height: 15,
                                )
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
