import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_content_widget.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/utils/image_utils.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  static const String routeName = '/hadeth_details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var hadethItem = ModalRoute.of(context)?.settings.arguments as HadethItem;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(getImagePathName(
              imageName: provider.currentTheme == ThemeMode.light
                  ? 'main_background.png'
                  : 'main_background_dark.png')),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(hadethItem.title),
        ),
        body: ClipRRect(
          child: Card(
            child: HadethContentWidget(
              content: hadethItem.content,
            ),
          ),
        ),
      ),
    );
  }
}
