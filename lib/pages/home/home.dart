import 'package:detailpageui/widgets/animation/fadeAnimation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<List<String>> products = [
    [
      'assets/images/blazer-1.jpg',
      'Dev Hub Blazer One',
      '100 \$'
    ],
    [
      'assets/images/blazer-2.jpeg',
      'Dev Hub Blazer Two',
      '200 \$'
    ],
    [
      'assets/images/blazer-3.jpeg',
      'Dev Hub Blazer Three',
      '150 \$'
    ],
    [
      'assets/images/blazer-4.jpeg',
      'Dev Hub Blazer FOUR',
      '250 \$'
    ]
  ];

  int currentIndex = 0;

  void _next(){
    setState(() {
      if(currentIndex < products.length-1){
        currentIndex++;
      }else{
        currentIndex = currentIndex;
      }
    });
  }

  void _preve(){
    setState(() {
      if(currentIndex >0 ){
        currentIndex--;
      }else{
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) => {
                if(details.velocity.pixelsPerSecond.dx < 0){
                  _next()
                }else if(details.velocity.pixelsPerSecond.dx > 0){
                  _preve()
                }
              },
              child: FadeAnimation(delay: 0.8, child: Container(
                width: double.infinity,
                height: 650,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(products[currentIndex][0]),
                    fit: BoxFit.cover
                  )
                  
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.blueGrey,
                        Colors.grey.withOpacity(.0)
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 110,
                        margin: EdgeInsets.only(bottom: 60),
                        child: Row(
                          children: buildIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -50),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     FadeAnimation(delay:1.5, child: Text(products[currentIndex][1], style: TextStyle(color: Colors.blueGrey, fontSize: 40, fontWeight: FontWeight.bold))),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          FadeAnimation(delay:1.8, child: Text(products[currentIndex][2], style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 22),)),
                          SizedBox(width: 10),
                          FadeAnimation(delay:2.2, child:  Row(
                            children: [
                              Icon(Icons.star, size: 18, color: Colors.yellow[700]),
                              Icon(Icons.star, size: 18, color: Colors.yellow[700]),
                              Icon(Icons.star, size: 18, color: Colors.yellow[700]),
                              Icon(Icons.star, size: 18, color: Colors.yellow[700]),
                              Icon(Icons.star_half, size: 18, color: Colors.yellow[700]),
                               SizedBox(width: 10),
                              Text("4.5/80 reviews", style: TextStyle(color: Colors.blueGrey, fontSize: 14))
                            ],
                          ))
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: FadeAnimation(delay:2.5, child:   Text("Add to Cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive){
    return Expanded(
      child: Container(
        height: 5,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.blueGrey: Colors.white
        ),
      )
    );
  }

  List<Widget> buildIndicator(){
    List<Widget> indicator = [];
    for(int i =0; i< products.length; i++){
      if(currentIndex == i){
       indicator.add(_indicator(true));
      }else{
         indicator.add(_indicator(false));
      }
     
    }
    return indicator;
  }
}