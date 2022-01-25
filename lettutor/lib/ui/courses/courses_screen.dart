import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/ui/courses/course_search_result_screen.dart';
import 'package:lettutor/ui/courses/courses_horizontal.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool _isLoading = true;

  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    Provider.of<CourseProvider>(context, listen: false)
        .fetchListCourse("1", "1000")
        .then((_) {
      setState(() {
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
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        body: _isLoading ? const CircularProgressIndicator() :
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
                width: size.width,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: CupertinoSearchTextField(
                        controller: _searchController,
                        placeholder: AppLocalizations.of(context).translate(LanguageKey.search_course),
                        onSubmitted: (keyWord) {
                          if(keyWord != '') {
                            _searchController.clear();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CourseSearchResultScreen(nameKey: keyWord)));
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

          //CourseHorizontal(category: "English for Beginners"),
          Consumer<CourseProvider>(
            builder: (context, courseData, _) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: Course.allCategory.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                Course.allCategory[index],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            CourseHorizontal(category: Course.allCategory[index]),
                          ],
                        );
                      }));
            },
          ),
              SizedBox(
                height: 15,
              ),

            ],
          ),
        ));
  }
}
