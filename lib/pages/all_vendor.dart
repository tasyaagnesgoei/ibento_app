import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibento_app/pages/home_page.dart';
import 'package:ibento_app/widgets/vendor_tile.dart';

class AllVendorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6DFEB),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 60.0, left: 30, right: 30, bottom: 60),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Image.asset(
                      "assets/back_arrow.png",
                      width: 22,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "All Organizer",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              VendorTile(
                imageUrl: "assets/organizer_one.png",
                organizerCategory: "Engagement Organizer",
                organizerName: "Jo Malone Organizer",
                peopleUrl: "assets/people_one.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "Tanggerang",
              ),
              SizedBox(
                height: 15,
              ),
              VendorTile(
                imageUrl: "assets/organizer_two.png",
                organizerCategory: "Birthday Organizer",
                organizerName: "Evening Organizer",
                peopleUrl: "assets/people_two.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "BSD City",
              ),
              SizedBox(
                height: 15,
              ),
              VendorTile(
                imageUrl: "assets/organizer_three.png",
                organizerCategory: "Wedding Organizer",
                organizerName: "You Organizer",
                peopleUrl: "assets/people_three.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "Jakarta Utara",
              ),
              SizedBox(
                height: 15,
              ),
              VendorTile(
                imageUrl: "assets/organizer_four.png",
                organizerCategory: "Birthday Organizer",
                organizerName: "Collectivity Organizer",
                peopleUrl: "assets/people_one.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "Tanggerang",
              ),
              SizedBox(
                height: 15,
              ),
              VendorTile(
                imageUrl: "assets/organizer_five.png",
                organizerCategory: "Engagement Organizer",
                organizerName: "Jo Malone Organizer",
                peopleUrl: "assets/people_one.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "Tanggerang",
              ),
              SizedBox(
                height: 15,
              ),
              VendorTile(
                imageUrl: "assets/organizer_two.png",
                organizerCategory: "Engagement Organizer",
                organizerName: "Jo Malone Organizer",
                peopleUrl: "assets/people_one.png",
                ratingUrl: "assets/rating.png",
                locationUrl: "assets/landmark.png",
                cityName: "Tanggerang",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home_button.png',
              width: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_notification.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_love.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_user.png',
              width: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
