import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/views/add_category/category_task.dart';
import 'package:to_do_list/views/my_theme.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tambahkan Category Task"),
        ),
        body: Container(
          color: MyTheme.grey,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: CategoryTask(),
                  )),
        ));
  }
}
