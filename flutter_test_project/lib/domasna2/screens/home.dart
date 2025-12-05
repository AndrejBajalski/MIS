import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/category.dart';
import 'package:namer_app/domasna2/services/datafetch_service.dart';
import 'package:namer_app/domasna2/widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatafetchService _dataFetch = DatafetchService();
  late Future<List<FoodCategory>> _allCategories;

  @override
  void initState() {
    super.initState();
    _allCategories = _dataFetch.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Categories"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/randomRecipe");
            },
            child: Text("Recipe of the week"),
          ),
        ],
      ),
      body: FutureBuilder<List<FoodCategory>>(
        future: _allCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No categories found."));
          } else {
            final categories = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryWidget(category: category);
              },
            );
          }
        },
      ),
    );
  }
}
