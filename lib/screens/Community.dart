import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dustbin {
  String img = '';
  String name = '';
  String use = '';
  Color ui = Colors.white;

  dustbin(String img, String name, String use, Color ui) {
    this.img = img;
    this.name = name;
    this.use = use;
    this.ui = ui;
  }
}

dustbin blue = new dustbin(
    'assets/images/3.png',
    "Recycling Bin",
    "Blue dustbins are generally used for recyclable materials like paper, cardboard, plastic bottles, glass, and aluminum cans. These materials are separated from general waste to be recycled and processed into new products.",
    Color(0xff03045E));
dustbin green = new dustbin(
    'assets/images/1.png',
    "Organic Waste Bin",
    "Green dustbins are designed for organic waste, such as food scraps, yard trimmings, and other biodegradable materials. This waste can be composted to create nutrient-rich soil.",
    Color(0xff1BA261));
dustbin black = new dustbin(
    'assets/images/2.png',
    "General Waste Bin",
    "Black dustbins are used for non-recyclable, non-compostable, and general household waste. This includes items like plastic bags, diapers, sanitary products, and items that cannot be recycled or composted.",
    Color(0xff1D2D44));
dustbin yellow = new dustbin(
    'assets/images/4.png',
    "Hazardous Waste Bin",
    "Yellow dustbins are used for hazardous waste materials, including chemicals, batteries, electronics, and other potentially harmful substances. Proper disposal of hazardous waste is essential to protect the environment and human health.",
    Color(0xffFCA311));

List<dustbin> bin = [blue, green, black, yellow];

class tip extends StatefulWidget {
  const tip({super.key});

  @override
  State<tip> createState() => _tipState();
}

class _tipState extends State<tip> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: bin.length,
            itemBuilder: (context, count) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  color: bin[count].ui,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(bin[count].img),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  bin[count].name,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Container(
                                child: Column(
                              children: [
                                Text(
                                  bin[count].use,
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
