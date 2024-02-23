import 'package:donation/core/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'item_track.dart';

class DataListView extends StatelessWidget {
  const DataListView({super.key, required this.items});

  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: ItemTrack(item: items[index]),
          ),
        ),
      ),
      itemCount: items.length,
    );
  }
}
