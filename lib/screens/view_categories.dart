import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data/helper/colors_res.dart';
import 'package:flutter_application_1/data/models/category.dart';
import 'package:flutter_application_1/data/services/dio_services.dart';

class ViewCategories extends StatefulWidget {
  const ViewCategories({Key? key}) : super(key: key);

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  List<Categories> categories = [
    Categories(categoryID: 0, name: "loading"),
  ];
  @override
  void initState() {
    //TODO: request to read data from the backend
    loadCat();
  }

  Future<void> loadCat() async {
    DioServices dioServices = DioServices();
    var cat = await dioServices.getTheCategoriesList();
    setState(() {
      categories = cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Categories")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Card(
                      elevation: 8,
                      shadowColor: ColorsRes.appcolor,
                      child: Text(categories[index].name)),
                );
              }),
        ),
      ),
    );
  }
}
