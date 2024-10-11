import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/ui/home/tabs/quran_tab/sura_title_widget.dart';
import 'package:islami/utils/image_utils.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    //var quranDetailsProvider = Provider.of<QuranDetailsProvider>(context);
    var provider = Provider.of<SettingsProvider>(context);
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;

    if (verses.isEmpty) {
      loadFile(arguments.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathName(
            imageName: provider.currentTheme == ThemeMode.light
                ? 'main_background.png'
                : 'main_background_dark.png')),
      )),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(arguments.suraTitle),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  child: Column(
                    children: [
                      Divider(
                        indent: 150,
                        endIndent: 150,
                        thickness: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: buildVerseSpans(context),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  List<InlineSpan> buildVerseSpans(BuildContext context) {
    List<InlineSpan> spans = [];

    for (int i = 0; i < verses.length; i++) {
      spans.add(TextSpan(
          text: verses[i].trim(),
          style: GoogleFonts.amiriQuran(
              textStyle: Theme.of(context).textTheme.bodySmall)));
      spans.add(TextSpan(
        text: ' ${i + 1} ',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: 'AyatQuran11-m2Lj9',
              fontSize: 30.sp,
              color: Colors.grey,
            ),
      ));
    }

    return spans;
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.trim().split('\n');

    verses = suraLines.where((line) => line.trim().isNotEmpty).toList();

    setState(() {});
  }
}
