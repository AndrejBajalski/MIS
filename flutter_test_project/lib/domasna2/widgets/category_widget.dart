import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final FoodCategory category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>{
        Navigator.pushNamed(context, '/meals', arguments: {'category': category.name})
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(category.thumbnail, fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                category.description,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
