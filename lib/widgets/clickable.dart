import 'package:flutter/material.dart';
import 'package:clicker_game/models/app_state.dart';
import 'package:provider/provider.dart';

class Clickable extends StatelessWidget {
  const Clickable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var addMoney = appState.addMoney;

    return TextButton(
      child: const Image(image: AssetImage("assets/duck.png")),
      onPressed: () => {addMoney()},
    );
  }
}

