import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> icon = [
  'assets/images/amazon.png',
  'assets/images/myntra.png',
  'assets/images/flipkart.png',
  'assets/images/nykaa.png',
];
List<String> coins = [
  '500',
  '1000',
  '1500',
  '2000',
];

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  final int targetNumber = 100; // Change this to your desired number

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Change the duration as needed
    );

    _animation = IntTween(begin: 0, end: targetNumber).animate(_controller)
      ..addListener(() {
        setState(() {}); // Trigger a rebuild when the animation value changes
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffffb700), Color(0xffffd60a)],
                  )),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "My Coins",
                      style: GoogleFonts.poppins(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${_animation.value}', // Display the current value of the animation
                          style: GoogleFonts.poppins(
                              fontSize: 70, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/images/coins.png',
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, count) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffE7E7E7), Color(0xffF5F5F5)],
                            )),
                        child: Column(
                          children: [
                            Flexible(child: Container()),
                            Image.asset(
                              icon[count],
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(13),
                                      bottomRight: Radius.circular(13))),
                              height: 20,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "Redeem for ${coins[count]}",
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffffb700), Color(0xffffd60a)],
                  )),
              child: Center(
                  child: Text(
                "Redeem Now",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
