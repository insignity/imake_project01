import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

List<IntSize> _createSizes(int count) {
  Random rnd = Random();
  return List.generate(
      count, (i) => IntSize((rnd.nextInt(500) + 200), rnd.nextInt(500) + 100));
}

class AllPosts extends StatelessWidget {
  AllPosts() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 1000;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
      ),
    );
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    FadeInImage.memoryNetwork(
                      fadeInDuration: Duration(milliseconds: 500),
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                      image:
                          'https://picsum.photos/${size.width}/${size.height}/',
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                          Text(
                            '@User#${size.height}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
