import 'package:flutter/material.dart';
import 'package:new_app/details_screen.dart';

class productItem extends StatefulWidget {
  const productItem({Key? key}) : super(key: key);

  @override
  State<productItem> createState() => _productItemState();
}

class _productItemState extends State<productItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => details_screen(),));
                                  },
                                  child: Image(
                                    image: AssetImage('images/T_shirt.jpeg'),
                                    width: 150.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                        size: 15.0,
                                      ),
                                    ),
                                    backgroundColor: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Regular Fit Slogan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "\$1.190",
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ],
                        ),

    );
  }
}
