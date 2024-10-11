import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/services/api_manger/api.dart';
import 'package:provider/provider.dart';

import '../../../../providers/settings_provider/settings_provider.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final player = AudioPlayer();
  bool isPlay = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return FutureBuilder(
        future: ApiManger.getRadio(),
        builder: (context, snap) {
          var radios = snap.data?.radios ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/radio...png"),
              snap.connectionState == ConnectionState.waiting
                  ? CircularProgressIndicator(
                      color: theme.primaryColor,
                    )
                  : Text(
                      radios[index].name ?? "",
                      style: theme.textTheme.bodySmall,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (index > 0) {
                          index--;
                          await player.stop();
                          await player.play(UrlSource(radios[index].url ?? ""));
                          isPlay = true;
                          setState(() {});
                        }
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: provider.currentTheme == ThemeMode.light
                            ? theme.colorScheme.primary
                            : theme.colorScheme.primary,
                      )),
                  IconButton(
                      onPressed: () async {
                        if (isPlay) {
                          await player.stop();
                          isPlay = false;
                        } else {
                          await player.play(UrlSource(radios[index].url ?? ""));
                          isPlay = true;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        isPlay ? Icons.stop : Icons.play_arrow,
                        size: 50,
                        color: provider.currentTheme == ThemeMode.light
                            ? theme.colorScheme.primary
                            : theme.colorScheme.primary,
                      )),
                  IconButton(
                      onPressed: () async {
                        if (index < radios.length - 1) {
                          index++;
                          await player.stop();
                          await player.play(UrlSource(radios[index].url ?? ""));
                          isPlay = true;
                          setState(() {});
                        }
                      },
                      icon: Icon(
                        Icons.skip_next,
                        size: 40,
                        color: provider.currentTheme == ThemeMode.light
                            ? theme.colorScheme.primary
                            : theme.colorScheme.primary,
                      )),
                ],
              ),
            ],
          );
        });
  }

  @override
  void deactivate() {
    player.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
