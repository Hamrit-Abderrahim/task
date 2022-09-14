import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task/core/utils/color_manager.dart';
import 'package:task/moduls/presentation/components/player_info.dart';
import 'package:task/moduls/presentation/components/textfromfieldcomponents.dart';

import '../../../core/utils/strings_manager.dart';
import '../components/add_player_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
          title: const Text(
            StringsManager.addPlayers,
            style: TextStyle(color: ColorManager.textColor),
          ),
          centerTitle: true,
          elevation: 0.0),
      body: CustomScrollView(
        key: const Key('playerScrollView'),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: const AddPlayer()),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormComponents(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 600,
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: PalyerInfo(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
