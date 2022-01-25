import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ui/tutors/tutor_search_result_screen.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  bool _isLoading = true;
  String _keyword = '';

  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    // Provider.of<TutorProvider>(context, listen: false)
    //     .fetchListTutor("4", "1")
    //     .then((_) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              placeholder: AppLocalizations.of(context).translate(LanguageKey.search_tutor),
              onSubmitted: (keyWord) {
                setState(() {
                  _keyword = keyWord;
                });
                if(_keyword != '') {
                  _searchController.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TutorSearchResultScreen(nameKey: keyWord)));
                }
              },

            ),
            SizedBox(height: mediumSpacer),
            Consumer<TutorProvider>(
              builder: (context, tutorData, _) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: tutorData.tutors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CustomCardTutor(
                            tutorId: tutorData.tutors[index].id,),
                          SizedBox(height: 15,),
                        ],
                      );
                    });


              },
            ),
          ],
        ),
      ),
    );
  }
}
