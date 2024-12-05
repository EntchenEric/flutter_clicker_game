import 'package:flutter/material.dart';
import 'dart:async';
import 'package:clicker_game/utils/upgrade_utils.dart';

class MyAppState extends ChangeNotifier {
  var money = 0.0;
  var farmers = 0;
  var swimmers = 0;
  var fishermen = 0;
  var miners = 0;
  var lumberjacks = 0;
  var hunters = 0;
  var explorers = 0;

  late Timer _afkMoneyTimer; // Declare the timer as a late field.

  MyAppState() {
    // Start the AFK money generation timer when the state is created.
    _afkMoneyTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      addAfkMoney();
    });
  }

  void addAfkMoney() {
    if (swimmers > 0) {
      money += swimmers * 0.1;
      notifyListeners();
    }
    if (fishermen > 0) {
      money += fishermen * 0.2;
      notifyListeners();
    }
    if (miners > 0) {
      money += miners * 0.3;
      notifyListeners();
    }
    if (lumberjacks > 0) {
      money += lumberjacks * 0.4;
      notifyListeners();
    }
    if (hunters > 0) {
      money += hunters * 0.5;
      notifyListeners();
    }
    if (explorers > 0) {
      money += explorers * 0.6;
      notifyListeners();
    }
  }

  void addMoney() {
    var addedMoney = 1;
    addedMoney = addedMoney * farmers + 1;
    money = money + addedMoney;
    notifyListeners();
  }

  void addFarmer(context) {
    var cost = getUpgradeCosts(0, farmers);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    farmers = farmers + 1;
    money = money - cost;
    notifyListeners();
  }

  void addSwimmer(context) {
    var cost = getUpgradeCosts(1, swimmers);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld! :("),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    swimmers = swimmers + 1;
    money = money - cost;
    notifyListeners();
  }

  void addFisherman(context) {
    var cost = getUpgradeCosts(2, fishermen);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    fishermen++;
    money -= cost;
    notifyListeners();
  }

  void addMiner(context) {
    var cost = getUpgradeCosts(3, miners);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    miners++;
    money -= cost;
    notifyListeners();
  }

  void addLumberjack(context) {
    var cost = getUpgradeCosts(4, lumberjacks);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    lumberjacks++;
    money -= cost;
    notifyListeners();
  }

  void addHunter(context) {
    var cost = getUpgradeCosts(5, hunters);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    hunters++;
    money -= cost;
    notifyListeners();
  }

  void addExplorer(context) {
    var cost = getUpgradeCosts(6, explorers);
    if (cost > money) {
      const snackBar = SnackBar(
        content: Text("Du hast nicht genug Geld!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    explorers++;
    money -= cost;
    notifyListeners();
  }

  @override
  void dispose() {
    // Dispose of the timer when the state is disposed.
    _afkMoneyTimer.cancel();
    super.dispose();
  }
}