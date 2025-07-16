import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  List<Widget> _buildGrid() {
    List<Widget> tiles = [];

    for (int row = 9; row >= 0; row--) {
      List<Widget> rowTiles = [];
      for (int col = 0; col < 10; col++) {
        int number = row.isEven
            ? (row * 10 + col + 1)
            : (row * 10 + (9 - col) + 1);

        rowTiles.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              color: number % 2 == 0 ? Colors.blue[50] : Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      }
      tiles.addAll(rowTiles);
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        crossAxisCount: 10,
        children: _buildGrid(),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
