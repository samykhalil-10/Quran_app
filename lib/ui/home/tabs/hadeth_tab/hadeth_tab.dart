import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_title_widget.dart';
import 'package:islami/utils/image_utils.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) loadHadethFile();
    return Container(
      child: hadethList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                        getImagePathName(imageName: 'hadith_header.png'))),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => HadethTitleWidget(
                            hadethItem: hadethList[index],
                          ),
                      separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 2,
                            color: Theme.of(context).dividerColor,
                            margin: EdgeInsets.symmetric(horizontal: 28),
                          ),
                      itemCount: hadethList.length),
                )
              ],
            ),
    );
  }

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadeth = fileContent.trim().split('#');

    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> hadethLines = allAhadeth[i].trim().split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join('\n');

      HadethItem hadethItem =
          HadethItem(title: hadethTitle, content: hadethContent);

      hadethList.add(hadethItem);
    }
    setState(() {});
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem({required this.title, required this.content});
}
