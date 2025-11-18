import 'package:flutter/material.dart';
import 'package:namer_app/domasna2/models/meal.dart';
import 'package:namer_app/domasna2/services/datafetch_service.dart';
import 'package:namer_app/domasna2/widgets/meal_widget.dart';

class MealsPage extends StatefulWidget {
  @override
  MealsPageState createState() => MealsPageState();
}

class MealsPageState extends State<MealsPage> {
  late List<Meal> meals;
  bool _isLoading = true;
  late String categoryName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final DatafetchService datafetchService = DatafetchService();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryName = arguments['category'];
    datafetchService.fetchMealsByCategory(categoryName).then((fetchedMeals) {
      if(mounted){
        setState(() {
          meals = fetchedMeals;
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals in $categoryName')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0
              ),
              itemCount: meals.length,
              itemBuilder: (context, index) => MealWidget(meal: meals[index]),
              padding: EdgeInsets.all(22.0)
            ),
    );
  }
}
