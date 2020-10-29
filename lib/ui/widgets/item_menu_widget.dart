import 'package:flutter/material.dart';

class ItemMenuWidget extends StatelessWidget {
  const ItemMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://via.placeholder.com/150'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Menu'),
            Text('Rp'),
          ],
        ),
      ),
    );
  }
}
