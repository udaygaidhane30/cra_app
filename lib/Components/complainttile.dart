import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CompTile extends StatefulWidget {
  @override
  final String cTitle;
  final String description;
  CompTile({super.key, required this.cTitle, required this.description});

  @override
  State<CompTile> createState() => _CompTileState();
}

class _CompTileState extends State<CompTile> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(widget.cTitle),
              subtitle: Text(widget.description),
            ),
            const SizedBox(
              height: 7.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  size: 40,
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xFFC3B1E1),
                    dotSecondaryColor: Colors.purple.shade700,
                  ),
                  circleColor: CircleColor(
                      start: Color(0xFFC3B1E1), end: Colors.purple.shade700),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.arrow_circle_up_rounded,
                      color: isLiked ? Color(0xFF645CBB) : Colors.grey,
                      size: 40,
                    );
                  },
                  onTap: onLikeButtonTapped,
                  likeCount: 665,
                  countBuilder: (count, isLiked, text) {
                    var color = isLiked ? Color(0xFF645CBB) : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        'Upvote',
                        style: TextStyle(color: color),
                      );
                    } else {
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                      return result;
                    }
                  },
                ),
                Text(
                  'Status',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerCard extends StatefulWidget {
  final String cTitle;
  final String description;
  ContainerCard({super.key, required this.cTitle, required this.description});

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            alignment: Alignment.centerLeft,
            height: 200,
            decoration: BoxDecoration(color: Colors.grey.shade200, boxShadow: [
              const BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                    7.0, // Move to right 7.0 horizontally
                    8.0, // Move to bottom 8.0 Vertically
                  ))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      widget.cTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const LikeButton(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
