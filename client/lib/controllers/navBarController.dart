import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';

class NavBarController extends GetxController {

  final _currentIndex = 0.obs;

  get currentIndex => this._currentIndex.value;
  set currentIndex(index) => this._currentIndex.value = index;
}