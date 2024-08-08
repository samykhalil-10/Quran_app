import 'package:flutter/material.dart';
import 'package:islami/providers/quran_details_provider/quran_details_provider.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_details/verse_widget.dart';
import 'package:islami/ui/home/tabs/quran_tab/sura_title_widget.dart';
import 'package:islami/utils/image_utils.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var quranDetailsProvider = Provider.of<QuranDetailsProvider>(context);
    var provider = Provider.of<SettingsProvider>(context);
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;
    quranDetailsProvider.loadFile(arguments.index);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
            getImagePathName(imageName: provider.getBackgroundImageName())),
      )),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(arguments.suraTitle),
          ),
          body: quranDetailsProvider.quran.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        VerseWidget(verse: quranDetailsProvider.quran[index]),
                    separatorBuilder: (context, index) => Divider(
                        endIndent: 24,
                        indent: 24,
                        color: Theme.of(context).dividerColor),
                    itemCount: quranDetailsProvider.quran.length,
                  ),
                )),
    );
  }

// void loadFile(int index) async {
//   String fileContent =
//   await rootBundle.loadString('assets/files/${index + 1}.txt');
//   List<String> suraLines = fileContent.split('\n');
//
//   verses = suraLines;
//
//   suraLines.forEach(
//         (element) {
//       print(element);
//     },
//   );
//   setState(() {});
// }
}
