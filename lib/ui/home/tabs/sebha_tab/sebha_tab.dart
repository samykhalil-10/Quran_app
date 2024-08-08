import 'package:flutter/material.dart';
import 'package:islami/utils/image_utils.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  List<String> SebhaWords = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int index = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController with duration and vsync
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this, // Ensure vsync is provided by SingleTickerProviderStateMixin
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                    top: 0,
                    left: 100,
                    child: Image.asset(
                        getImagePathName(imageName: 'head of seb7a.png'))),
                GestureDetector(
                    onTap: () {
                      onPres();
                    },
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Image.asset(
                            getImagePathName(imageName: 'body of seb7a.png')))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('عدد التسبيحات',
                    style: Theme.of(context).textTheme.labelMedium),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text(
                    '$counter',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text(
                    SebhaWords[index],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPres() {
    setState(() {
      counter++;
      if (counter % 34 == 0) {
        counter = 1;
        index = (index + 1) % SebhaWords.length;
      }
    });
    _controller.forward(from: 0.0);
  }
}
