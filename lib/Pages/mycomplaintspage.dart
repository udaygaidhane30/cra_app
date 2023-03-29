import 'package:cra_complaints/Components/complainttile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCompTab extends StatefulWidget {
  const MyCompTab({super.key});

  @override
  State<MyCompTab> createState() => _MyCompTabState();
}

class _MyCompTabState extends State<MyCompTab> {
  final List _complaintsT = [
    'comp1',
    'comp2',
    'comp3',
    'comp4',
  ];
  final List _complaintsD = [
    'comp1',
    'comp2',
    'comp3',
    'comp4',
  ];
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: _handleRefresh,
      color: Colors.deepPurple,
      backgroundColor: Colors.deepPurple[70],
      height: 200,
      animSpeedFactor: 1.5,
      springAnimationDurationInMilliseconds: 700,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("complaints")
              .where("idnum",
                  isEqualTo: FirebaseAuth.instance.currentUser?.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return CompTile(
                    cTitle: snapshot.data?.docs[index]['title'],
                    description: snapshot.data?.docs[index]['description'],
                    likeCount: snapshot.data?.docs[index]['upvote'],
                    status: snapshot.data?.docs[index]["status"],
                    uid: snapshot.data?.docs[index]["uid"],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("No -tt- Data"),
              );
            }
          }),
    );
  }
}
