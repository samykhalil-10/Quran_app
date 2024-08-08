import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeThemeMode(ThemeMode.light);
              },
              child: provider.currentTheme == ThemeMode.light
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.light)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.light)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                provider.changeThemeMode(ThemeMode.dark);
              },
              child: provider.currentTheme == ThemeMode.dark
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.dark)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget buildSelectedThemeItem(String selectedTheme) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            selectedTheme,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        Icon(
          Icons.check,
          size: 30,
          weight: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  Widget buildUnSelectedThemeItem(String unSelectedTheme) {
    return Row(
      children: [
        Text(
          unSelectedTheme,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
