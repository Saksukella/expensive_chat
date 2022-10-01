import 'package:flutter/material.dart';

import 'animation/custom_anims.dart';
import 'theme/custom_themes.dart';

class Customizations extends StatelessWidget {
  const Customizations({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Customization"),
      ),
      body: ListView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        children: [
          CustomThemes(
            scrollController: scrollController,
          ),
          Divider(),
          CustomAnimations(
            scrollController: scrollController,
          ),
          Divider(),
        ],
      ),
    );
  }
}
