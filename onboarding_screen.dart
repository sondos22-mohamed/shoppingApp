import 'package:flutter/material.dart';
import 'package:new_app/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  BoardingModel({
    required this.image,
  });
}

class onBoardingScreen extends StatefulWidget {
  onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<BoardingModel> boardind = [
    BoardingModel(image: 'images/shopingimage.jpeg'),
    BoardingModel(image: 'images/shop image.jpeg'),
    BoardingModel(image: 'images/shop image.jpeg'),
  ];
  bool isLast = false;
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: ()
            {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          },
            child:
          Text (
              'SkiP ',
            style: TextStyle(
              color: Colors.pink,
            ),
          ),

          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: PageView.builder(
          onPageChanged: (int index) {
            if (index == boardind.length-1){
              setState(() {isLast = true;});
            } else{
              setState(() {isLast = false;});
            }
          },
          controller: boardController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildBordingItem(boardind[index]),
          itemCount: boardind.length,
        ),
      ),
    );
  }

  Widget buildBordingItem(BoardingModel model) => Column(children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            SmoothPageIndicator(
                controller: boardController,
                count: boardind.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 5.0,
                expansionFactor: 4.0,
                activeDotColor: Colors.pink,
              ),
            ),
            Spacer(),
            FloatingActionButton(
              backgroundColor: Colors.pink,
              elevation: 0.0,
              mini: true,
              onPressed: () {
                if(isLast){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                };
                boardController.nextPage(
                    duration: Duration(
                      milliseconds: 800,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ],
        ),
      ]);
}
