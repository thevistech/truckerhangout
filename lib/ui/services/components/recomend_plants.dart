

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/components/start_rating_widget.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';


class RecomdedList extends StatelessWidget {
  const RecomdedList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "https://westerntruckschool.com/wp-content/uploads/2019/08/sunrise-trucker-1.jpg",
            title: "American Truck Training",
            country: "Truck Center - Dallas",
            reviews: 12,
            press: () {

            },
          ),
          RecomendPlantCard(
            image: "https://cf.nearsay.com/sites/default/files/styles/1200x628/public/content_images/truck-driving-school-medina-oh.jpg",
            title: "Truck Driver Institute",
            country: "Truck Center - Dallas",
            reviews: 45,
            press: () {

            },
          ),
          RecomendPlantCard(
            image: "https://www.americatruckdriving.com/wp-content/uploads/2020/06/Total-Distribution-Trucking.jpg",
            title: "Commercial Driver Training",
            country: "Truck Center - Dallas",
            reviews: 2,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.reviews,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int reviews;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9),
        )),
      margin: EdgeInsets.only(left:5,right:5 ),
      width: size.width * 0.45,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(9),topRight: Radius.circular(9)),
            child: Image.network(image,width: size.width * 0.45,
            height: 100,fit: BoxFit.fill,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: UiColors.black,
                      fontWeight: FontWeight.bold),
                ),

                UIHelper.verticalSpace(4),
                Row(
                  children: <Widget>[
                    IconTheme(
                      data: IconThemeData(
                        color: Colors.amber,
                        size: 15,
                      ),
                      child: StarDisplay(
                          value: 3),
                    ),
                    UIHelper.horizontalSpace(4),
                    Text('(${reviews})',
                        style: TextStyle(fontSize: 10,color: Colors.black45)),

                  ],
                ),
                UIHelper.verticalSpace(4),
                Row(
                  children: <Widget>[
                    Text('Location :', style:TextStyle(fontSize: 12,color: Colors.black)),
                    Text(country,
                        style: TextStyle(fontSize: 10,color: Colors.black45)),

                  ],
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
