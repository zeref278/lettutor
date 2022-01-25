
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_course.dart';
import 'package:lettutor/ui/custom_widgets/custom_text.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class CourseSearchResultScreen extends StatefulWidget {

  final String nameKey;

  CourseSearchResultScreen({Key? key, required this.nameKey}) : super(key: key);



  @override
  _CourseSearchResultScreenState createState() => _CourseSearchResultScreenState();
}

class _CourseSearchResultScreenState extends State<CourseSearchResultScreen> {
  bool _isLoading =  true;
  late TextEditingController _searchController;
  List<Course> _listCourse = [];


  @override
  void initState() {
    _searchController = TextEditingController();
    Provider.of<CourseProvider>(context, listen: false)
        .searchCourse(widget.nameKey)
        .then((list) {
      setState(() {
        _listCourse = list;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<CourseProvider>(
      builder: (context, tutorData, _) {
        return
          Scaffold(
            backgroundColor: defaultBackgroundColor,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: mediumSpacer, right: mediumSpacer),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: mediumSpacer,
                  ),
                  CupertinoSearchTextField(
                    controller: _searchController,
                    placeholder: AppLocalizations.of(context).translate(LanguageKey.search_course),
                    onSubmitted: (keyWord) {
                      _searchController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CourseSearchResultScreen(nameKey: keyWord)));
                    },
                    onSuffixTap: () {
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(height: mediumSpacer),
                  _isLoading ? CircularProgressIndicator() :
                  Consumer<CourseProvider>(
                    builder: (context, courseData, _) {

                      return _listCourse.length == 0  ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50,),
                          Icon(CupertinoIcons.book,
                              color: Colors.red, size: 40),
                          SizedBox(width: 10),
                          CustomText(
                            LanguageKey.cannot_found_course, context,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          Text(
                            widget.nameKey,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 20),
                          )
                        ],
                      ):
                      Column(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              CustomText(LanguageKey.found_, context, style: TextStyle(fontSize: 16)),
                              Text(
                                '${_listCourse.length} ',
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              CustomText(LanguageKey.courses_by_keyword_, context,
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                "'${widget.nameKey}'",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _listCourse.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    CustomCardCourse(width: size.width * 0.9, course: _listCourse[index]),
                                    SizedBox(height: 15,),
                                  ],
                                );
                              }),
                        ],
                      );


                    },
                  ),
                ],
              ),
            ),
          );


      },
    );
  }
}
