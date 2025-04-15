import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Popular(String img, String name, String price, double rating,
    String desc, double lebar, double tinggi) {
  return Container(
    width: lebar,
    height: tinggi * 0.3, // Diperbesar agar tidak overflow
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 205, 202, 202)),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
          width: lebar * 0.35, // Diperbesar
          height: tinggi * 0.28, // Diperbesar
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(name,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 22, // Diperbesar
                                  fontWeight: FontWeight.w600))),
                    ),
                    Icon(Icons.favorite_border,
                        color: Color.fromARGB(255, 205, 202, 202))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Rp. ${price}",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 19, // Diperbesar
                            fontWeight: FontWeight.w400,
                            color: Colors.red))),
              ),
              Row(
                children: [
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 252, 210, 64), size: 24), // Diperbesar
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 252, 210, 64), size: 24),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 252, 210, 64), size: 24),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 252, 210, 64), size: 24),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 205, 202, 202), size: 24),
                  SizedBox(width: 5),
                  Text(rating.toString(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 17, // Diperbesar
                        fontWeight: FontWeight.w600,
                      )))
                ],
              ),
              SizedBox(height: 10), // Tambahan agar tidak terlalu rapat
              Expanded(
                child: Text(desc,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16, // Diperbesar
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
              )
            ],
          ),
        )
      ],
    ),
  );
}
