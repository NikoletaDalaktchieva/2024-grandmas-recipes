import 'package:flutter/material.dart';
import 'package:project1/constants.dart';

class Header extends StatelessWidget {
  final double size;
  final Function(String) onSearchChanged;

  const Header(this.size, {required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      height: 100,
      child: Row(
        children: [
          logo(),
          if (size > Breakpoints.tablet) title(size),
          const Spacer(),
          search(size),
          const Spacer(),
          if (size > Breakpoints.tablet) addRecipeButton(),
          const SizedBox(width: 10),
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

  Widget title(double size) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Grandma's"),
          if (size < Breakpoints.smallComputer)
            const TextSpan(
                text:
                    '\n'), //For smaller screens set the text to be on two rows
          const TextSpan(text: 'Recipes'),
        ],
      ),
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
        fontFamily: 'Cursive',
      ),
    );
  }

  Widget search(double size) {
    return SizedBox(
      width: (size > Breakpoints.tablet)
          ? size / 2
          : size -
              150, //Make the search bar flexible so it can fit bigger space on bigger screens.
      child: SearchBar(
          hintText: 'Search...',
          onChanged: onSearchChanged,
          backgroundColor: const WidgetStatePropertyAll(
            AppColors.elementColor,
            //TODO add search bar
          )),
    );
  }

  Widget addRecipeButton() {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Add your functionality here
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.elementColor),
        foregroundColor: WidgetStateProperty.all(AppColors.textColor),
      ),
      icon: const Icon(
        Icons.add,
        size: 24.0,
        color: AppColors.textColor,
      ),
      label: const Text("Add recipe"),
    );
  }
}
