import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import '../services/dio_services.dart';
import 'category.dart';
import 'sub_category.dart';

class MasterData extends Model {
//--------------------------------------------------------- Models -----------------------------------------------------------
  BuildContext context;
  User _user = User(firstName: 'Guest', id: -1);
  final DioServices _dioServices = DioServices();
  int NeedsCount = 0;
  List<Categories> _categories = [];
  List<SubCategory> _subCategories = [];
//--------------------------------------------------------- Getters -----------------------------------------------------------
  User get getUser => _user;
  List<Categories> get getListOfCategories => _categories;
  List<SubCategory> get getListOfSubCategories => _subCategories;
  DioServices get getDioServices => _dioServices;
//--------------------------------------------------------- Data Loading Functions -----------------------------------------------------------
  void l1() async {
    await loadUpData().whenComplete(() => print('Data Loaded'));
  }

  Future<void> loadUpData() async {
    // List<SubCategory> tempList = await _dioServices.getTheSubCategoriesList();
    List<Categories> tempList2 = await _dioServices.getTheCategoriesList();
    NeedsCount = await _dioServices.getTheNeedsCount();
    // await loadUpUser();
    _categories.clear();
    // _categories.add(Categories(categoryID: 0, name: 'Select a Category'));
    // _categories.addAll(tempList2);
    // _subCategories.clear();
    // _subCategories.add(SubCategory(
    //     subID: 0, categoryID: 0, name: 'Select a Sub Category', unit: 'unit'));
    // _subCategories.addAll(tempList);
    notifyListeners();
  }

  // Future<void> loadUpUser() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();

  //   if (pref.containsKey(StringsRes.userIdInSharedPrefs)) {
  //     _user = await _dioServices.getTheUser(
  //         int.parse(pref.getString(StringsRes.userIdInSharedPrefs) as String));
  //     print('User ID : ${pref.getString(StringsRes.userIdInSharedPrefs)}');
  //     print('User TOKEN : ${pref.getString(StringsRes.tokenInSharedPrefs)}');
  //     notifyListeners();
  //   }
  // }
  //--------------------------------------------------------- change User  -----------------------------------------------------------

  void setUserFirstName(User user) {
    _user = user;
    loadUpData();
    notifyListeners();
  }

  //--------------------------------------------------------- Constructor -----------------------------------------------------------
  MasterData(this.context) {
    print('Constructor Called');
    // loadUpData().whenComplete(() => print('Completed + ${_user.firstName}'));
    l1();
  }
}
