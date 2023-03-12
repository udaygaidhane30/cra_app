import 'package:cra_complaints/Components/complainttile.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _complaintsT.length,
          itemBuilder: ((context, index) {
            return CompTile(
              cTitle: _complaintsT[index],
              description: _complaintsD[index],
            );
          })),
    );
  }
}
