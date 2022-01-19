
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_tutor.dart';
import 'package:provider/provider.dart';

class TutorSearchResultScreen extends StatefulWidget {

  final String nameKey;

  TutorSearchResultScreen({Key? key, required this.nameKey}) : super(key: key);



  @override
  _TutorSearchResultScreenState createState() => _TutorSearchResultScreenState();
}

class _TutorSearchResultScreenState extends State<TutorSearchResultScreen> {
  bool _isLoading =  true;
  late TextEditingController _searchController;



  @override
  void initState() {
    _searchController = TextEditingController();
    Provider.of<TutorProvider>(context, listen: false)
        .searchTutor(widget.nameKey)
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
    return Consumer<TutorProvider>(
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
                    placeholder: 'Search tutor',
                    onSubmitted: (keyWord) {
                      _searchController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TutorSearchResultScreen(nameKey: keyWord)));
                    },
                    onSuffixTap: () {
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(height: mediumSpacer),
                  _isLoading ? CircularProgressIndicator() :
                  Consumer<TutorProvider>(
                    builder: (context, tutorData, _) {
                      return tutorData.searchResults.length == 0  ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50,),
                          Icon(CupertinoIcons.person_badge_minus_fill,
                              color: Colors.red, size: 40),
                          SizedBox(width: 10),
                          Text(
                            'Cannot found tutor ',
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
                              Text('Found ', style: TextStyle(fontSize: 16)),
                              Text(
                                '${tutorData.searchResults.length} ',
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text('tutors for keyword ',
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
                              itemCount: tutorData.searchResults.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    CustomCardTutor(
                                      tutorId: tutorData.searchResults[index].id, keyWord: widget.nameKey,),
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
