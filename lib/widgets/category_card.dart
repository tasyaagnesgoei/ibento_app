import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  CategoryCard({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CategoryPage(
        //       name: name,
        //       imageUrl: imageUrl,
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
