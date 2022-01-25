import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_text.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EbookViewScreen extends StatefulWidget {
  final String pdfUrl;

  const EbookViewScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _EbookViewScreenState createState() => _EbookViewScreenState();
}

class _EbookViewScreenState extends State<EbookViewScreen> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(LanguageKey.ebook, context),
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
            actions: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration:
                const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(CupertinoIcons.bookmark_solid, color: Colors.black,),
                  onPressed: () {
                    _pdfKey.currentState!.openBookmarkView();
                  },

                ),
              ),
              SizedBox(width: 10,),

            ]),
        body: SfPdfViewer.network(
          widget.pdfUrl,
          controller: _pdfViewerController,
          key: _pdfKey,
        ));
  }
}
