import 'package:cra_complaints/Components/complainttile.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List _complaintsT = [
    'Fan not Working',
    'comp2',
    'comp3',
    'comp4',
    'comp5',
  ];

  final List _complaintsD = [
    'Fan of room 822 is running slow and regulator not working properly',
    'comp2',
    'comp3',
    'comp4',
    'comp5',
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
          physics: BouncingScrollPhysics(),
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
