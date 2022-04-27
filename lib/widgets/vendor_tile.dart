import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibento_app/pages/detail_page.dart';

class VendorTile extends StatelessWidget {
  final String imageUrl;
  final String organizerCategory;
  final String organizerName;
  final String peopleUrl;
  final String ratingUrl;
  final String locationUrl;
  final String cityName;

  VendorTile(
      {this.cityName,
      this.imageUrl,
      this.locationUrl,
      this.organizerCategory,
      this.organizerName,
      this.peopleUrl,
      this.ratingUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        width: 327,
        height: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0XFFF6F4FE),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                width: 79,
                height: 92,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      organizerCategory,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0XFF5669FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      organizerName,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0XFF120D26),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          peopleUrl,
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          ratingUrl,
                          width: 96,
                          height: 17,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          locationUrl,
                          width: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          cityName,
                          style: GoogleFonts.poppins(
                            color: Color(0xff747688),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
