import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibento_app/pages/all_vendor.dart';
import 'package:ibento_app/widgets/theme.dart';
import 'package:ibento_app/widgets/category_card.dart';
import 'package:ibento_app/widgets/job_title.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Tasya Goei',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/favorite_button.png',
                    width: 35,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 210,
                  height: 35,
                  child: TextFormField(
                    cursorColor: Color(0xff8686BF),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 11,
                        bottom: 11,
                      ),
                      fillColor: Color(0xffD9D8EA),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "I'm searching for..",
                      hintStyle: GoogleFonts.montserrat(
                        color: Color(0xff8686BF),
                        fontSize: 15,
                      ),
                      prefixIcon: InkWell(
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   PageRouteBuilder(
                          //     pageBuilder:
                          //         (context, animation1, animation2) =>
                          //             SearchPage(),
                          //     transitionDuration: Duration(seconds: 0),
                          //   ),
                          // );
                        },
                        child: Icon(
                          Icons.search,
                          color: Color(0xff8686BF),
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/filter_button.png',
                  height: 35,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget hotCategories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Categories',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllVendorPage()),
                    );
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                CategoryCard(
                  imageUrl: 'assets/organizer_four.png',
                  name: 'Sweet17 Party',
                ),
                CategoryCard(
                  imageUrl: 'assets/organizer_one.png',
                  name: 'Wedding Party',
                ),
                CategoryCard(
                  imageUrl: 'assets/organizer_two.png',
                  name: 'Birthday Party',
                ),
                CategoryCard(
                  imageUrl: 'assets/organizer_four.png',
                  name: 'Sweet17 Party',
                ),
                CategoryCard(
                  imageUrl: 'assets/organizer_one.png',
                  name: 'Wedding Party',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget justPosted() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event Organizer',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            JobTile(
              companyLogo: 'assets/organizer_one.png',
              name: 'Jo Malone Organizer',
              companyName: 'Jakarta',
            ),
            JobTile(
              companyLogo: 'assets/organizer_two.png',
              name: 'Evening Organizer',
              companyName: 'Bandung',
            ),
            JobTile(
              companyLogo: 'assets/organizer_three.png',
              name: 'Magical Organizer',
              companyName: 'Tanggerang',
            ),
          ],
        ),
      );
    }

    Widget bottomNavBar() {
      return BottomNavigationBar(
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
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              header(),
              hotCategories(),
              justPosted(),
            ],
          ),
        ),
      ),
    );
  }
}
