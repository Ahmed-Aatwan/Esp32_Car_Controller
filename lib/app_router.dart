import 'package:flutter/material.dart';
import 'package:grad_project/provider/guide_provider.dart';
import 'package:grad_project/views/guide_view.dart';
import 'package:grad_project/views/home_view.dart';
import 'package:provider/provider.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GuideProvider>(
      builder: (context, guideProvider, child) {
        if (guideProvider.seenGuide) {
          return const HomeView();
        } else {
          return const GuideView();
        }
      },
    );
  }
}
