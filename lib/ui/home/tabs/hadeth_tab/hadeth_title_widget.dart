import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_tab.dart';

class HadethTitleWidget extends StatelessWidget {
  HadethItem hadethItem;

  HadethTitleWidget({required this.hadethItem, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetailsScreen.routeName,
          arguments: hadethItem,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          hadethItem.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
