import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belajar/network/BannerGet.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String output = "no data";

  int _currentIndex=0;

  List sliderBanner = [
    ItemBanner1(),
    ItemBanner2(),
    ItemBanner3(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                //create list banner here
                // background: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // ),
                background: Column(
                  children: <Widget>[
                    CarouselSlider(
                      items: sliderBanner.map((card){
                        return Builder(
                          builder:(BuildContext context){
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Card(
                                color: Colors.transparent,
                                child: card,
                              ),
                            );
                          }
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250.0,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }
                      )
                    ),
                  ],
                ),
              ),
              title: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const  EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      height: 35.0,
                      width: double.infinity,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        placeholder: 'Cari Motor',
                        placeholderStyle: TextStyle(
                          color: Color(0xffC4C6CC),
                          fontSize: 14.0,
                          fontFamily: 'Brutal',
                        ),
                        prefix: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xffF0F1F5),
                        ),
                      )
                    )
                  )
                ],
              ),
              actions: [
                Icon(Icons.favorite),
                Icon(Icons.chat_bubble),
                Icon(Icons.notifications),
              ],
            )
          ];
        },
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuCategory(),
              Text(output),
              RaisedButton(onPressed: () {
                BannerGet.getBanners().then((value) {
                  output = "";
                  for (int i = 0; i < value.length; i++) {
                    output = output + "[ " + value[i].idBanner.toString() + value[i].name + " ]";
                  }
                  setState(() {

                  });
                });
              },
                child: Text("Get"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      children: listMenuCategory,
    );
  }
}

List<MenuCategoryItem> listMenuCategory = [
  MenuCategoryItem(
    title: 'Menu 1',
    icon: Icons.motorcycle,
    colorBox: Colors.blue,
    iconColor: Colors.white
  ),
  MenuCategoryItem(
      title: 'Menu 2',
      icon: Icons.audiotrack_outlined,
      colorBox: Colors.redAccent[400],
      iconColor: Colors.white
  ),
  MenuCategoryItem(
      title: 'Menu 3',
      icon: Icons.local_movies,
      colorBox: Colors.yellow[700],
      iconColor: Colors.white
  )
  // ,
  // MenuCategoryItem(
  //     title: 'Menu 4',
  //     icon: Icons.local_movies,
  //     colorBox: Colors.redAccent[400],
  //     iconColor: Colors.white
  // )
];

class MenuCategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color colorBox, iconColor;

  MenuCategoryItem({this.title, this.icon, this.colorBox, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: colorBox,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Icon(icon, color: iconColor,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Text(title, style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
        )
      ],
    );
  }

}

class ItemBanner1 extends StatelessWidget {
  const ItemBanner1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }
}

class ItemBanner2 extends StatelessWidget {
  const ItemBanner2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }
}

class ItemBanner3 extends StatelessWidget {
  const ItemBanner3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/flutter_dev.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}