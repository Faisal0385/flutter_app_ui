import 'package:flutter/material.dart';
import 'package:flutter_app_ui/food-recipe/Colors/colors.dart';
import 'package:flutter_app_ui/food-recipe/Models/recipe_model.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            const SizedBox(
              height: 30,
            ),
            mySearchField(),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Menu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  menuItems.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedIndex = index;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              selectedIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              selectedIndex == index
                                  ? Colors.greenAccent
                                  : Colors.white,
                            ])),
                        child: Text(
                          menuItems[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mySearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: searchBarColor,
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: Colors.black45,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black26),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Hello Faisal,\n",
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: "What do you want to eat today?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFNkJpg5tIB3DZsMqxgGCyRtSwDuav9LEdbZI06evMasI6tmkPahgI1ftvuA7qbHSsbgg&usqp=CAU",
                ),
              ),
              Positioned(
                right: 1,
                top: 1,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
