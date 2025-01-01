import 'package:flutter/material.dart';
import 'package:music_app/src/theme/color.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: AppColors.pink,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.pink,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "3:56",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1.2M",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
