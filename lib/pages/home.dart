import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/catogory_model.dart';
import '../models/diet_model.dart';
import '../models/popular_model.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatogoryModel> Catogories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];


  void getInitialInfo() {
    Catogories = CatogoryModel.getCatogories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Breakfast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icon/chevron-left-icon.svg',
              height: 20,
              width: 20,
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icon/ellipsis-h-icon.svg',
                height: 5,
                width: 5,
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xff1d1617).withOpacity(0.20),
                    blurRadius: 20,
                    spreadRadius: 0.0)
              ]),
              margin: EdgeInsets.only(top: 40, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 14, color: Color(0xffDDDADA)),
                    hintText: 'Search Pan Cake',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/icon/icons8-search.svg',
                      ),
                    ),
                    suffixIcon: Container(
                      width: 100,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                'assets/icon/slider-horizontal-svgrepo-com.svg',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Catogory',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        width: 25,
                      ),
                  itemCount: Catogories.length,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Catogories[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  Catogories[index].iconPath),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Catogories[index].name,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Recommendation\nfor Diet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(

              height: 240,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        width: 210,
                        decoration: BoxDecoration(
                            color: Catogories[index].boxColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(diets[index].iconPath),
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            Text(
                              diets[index].level +
                                  '|' +
                                  diets[index].duration +
                                  '|' +
                                  diets[index].calories,
                              style: TextStyle(color: Colors.black45),
                            ),
                            Container(
                              height: 45,
                              width: 130,
                              child: Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: diets[index].viewisSelected
                                          ? Colors.white
                                          : Colors.pinkAccent.withOpacity(0.50),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        diets[index].viewisSelected ? Color(
                                            0xff9DCEFF) : Colors.transparent,
                                        diets[index].viewisSelected ? Color(
                                            0xff92A3FD) : Colors.transparent
                                      ]
                                  ),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 25),
                  scrollDirection: Axis.horizontal,
                  itemCount: diets.length),
              padding: EdgeInsets.only(left: 20, right: 20),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
                ListView.separated(itemBuilder: (context, index) {
                  return Container(
                    height: 115,
                    // child: [
                    //   Row(
                    //
                    //   );
                    // ],
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(0.07),
                          offset: Offset(0,10),
                          blurRadius: 40,
                          spreadRadius: 0

                        )
                      ]
                    ),
                  );
                },
                    separatorBuilder: (context, index) => SizedBox(height: 25),
                    padding: EdgeInsets.only(left: 20,right: 20),
                    shrinkWrap: true,
                    itemCount: popularDiets.length)
              ],
            ),


          ],
        )
      ]),
    );
  }
}
