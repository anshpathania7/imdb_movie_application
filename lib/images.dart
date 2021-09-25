import 'package:flutter/material.dart';

AssetImage _getAssetImageForThisFile(String s) => AssetImage('assets/$s.png');

class Pngs {
  static AssetImage heart = _getAssetImageForThisFile('heart');
  static AssetImage calendar = _getAssetImageForThisFile('calendar');
  static AssetImage back = _getAssetImageForThisFile('back');
  static AssetImage cross = _getAssetImageForThisFile('cross');
  static AssetImage earth = _getAssetImageForThisFile('earth');

  static AssetImage search = _getAssetImageForThisFile('search');

  static AssetImage share = _getAssetImageForThisFile('share');

  static AssetImage sound = _getAssetImageForThisFile('sound');

  static AssetImage star = _getAssetImageForThisFile('star');
  static AssetImage bgBloop = _getAssetImageForThisFile('bg_bloop');

  static AssetImage time = _getAssetImageForThisFile('time');

  static AssetImage arrowDown = _getAssetImageForThisFile('arrow_down');
}
