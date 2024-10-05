import 'package:flutter/material.dart';
import 'package:project1/constants.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: AppColors.backgroundColor,
      height: 100,
      child: Row(
        children: [
          logo(),
          const SizedBox(width: 10),
          webpageName(),
          const Spacer(),
          search(),
          const Spacer(),
          addRecipeButton(),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget logo() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/logo.jpeg'),
      radius: 50,
    );
  }

  Widget webpageName() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          const SizedBox(height: 4),
          subtitle(),
        ]);
  }

  Widget title() {
    return const Text(
      "Grandma's Recipes",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
        fontFamily: 'Cursive',
      ),
    );
  }

  Widget subtitle() {
    return const Text(
      "Heartwarming dishes made with love",
      style: TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget search() {
    return const SizedBox(
      width: 700,
      child: SearchBar(
          hintText: 'Search...',
          backgroundColor: WidgetStatePropertyAll(
            AppColors.elementColor,
            //TODO add search bar
          )),
    );
  }

  Widget addRecipeButton() {
    return ElevatedButton(
      onPressed: () {
        //TODO
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.elementColor)),
      child: const Text("Add recipe"),
    );
  }
}
