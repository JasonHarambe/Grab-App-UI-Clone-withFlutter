import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab/constant.dart';

class SecondGridCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridList = [
      {
        'image': 'assets/ads1.jpg',
        'text': 'Save on repairs, installation & more',
        'expired': DateTime(2020, 12, 28),
        'hasDiscount': '20%',
      },
      {
        'image': 'assets/ads2.jpg',
        'text': 'Save on your first 2 orders',
        'duration': 3,
      },
      {
        'image': 'assets/ads3.jpg',
        'text': 'GrabFood delivery from as low as 50 sen',
        'duration': 10,
      },
      {
        'image': 'assets/ads4.jpg',
        'text': 'New Value Packages with more vouchers',
        'duration': 1,
        'hasDiscount': '30%',
      },
      {
        'image': 'assets/ads1.jpg',
        'text': 'Our latest opening hours',
        'expired': DateTime(2020, 12, 20),
        'updated': DateTime(2020, 12, 8),
      },
    ];

    const Map<int, String> monthsInYear = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          shrinkWrap: true,
          itemCount: gridList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: kSpacingUnit.w * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          alignment: Alignment.bottomLeft,
                          fit: BoxFit.cover,
                          image: AssetImage(gridList[index]['image']),
                        ),
                      ),
                    ),
                    gridList[index]['hasDiscount'] != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                            ),
                            child: Container(
                              width: kSpacingUnit.w * 10,
                              height: kSpacingUnit.w * 3,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Up to ${gridList[index]['hasDiscount']} off',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kSpacingUnit.w * 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    gridList[index]['updated'] != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                            ),
                            child: Container(
                              width: kSpacingUnit.w * 10,
                              height: kSpacingUnit.w * 3,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Updated ${(gridList[index]['updated'].day.toString())} ${monthsInYear[gridList[index]['updated'].month.toInt()]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kSpacingUnit.w * 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    child: Text(
                      gridList[index]['text'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: kSpacingUnit.w * 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    child: Row(
                      children: [
                        gridList[index]['expired'] != null
                            ? Icon(
                                Icons.calendar_today,
                                size: kSpacingUnit.w * 1.2,
                                color: Colors.black87,
                              )
                            : Icon(
                                Icons.chrome_reader_mode,
                                size: kSpacingUnit.w * 1.2,
                                color: Colors.black87,
                              ),
                        SizedBox(width: kSpacingUnit.w * 0.5),
                        gridList[index]['expired'] != null
                            ? Text(
                                "Until ${gridList[index]['expired'].day.toString()} ${monthsInYear[gridList[index]['expired'].month.toInt()]}",
                                style: TextStyle(
                                  fontSize: kSpacingUnit.w * 1.2,
                                  color: Colors.black87,
                                ),
                              )
                            : Text(
                                "${gridList[index]['duration'].toString()} min read",
                                style: TextStyle(
                                  fontSize: kSpacingUnit.w * 1.2,
                                  color: Colors.black87,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kSpacingUnit.w * 0.0,
            childAspectRatio: 0.65,
          ),
        ),
      ),
    );
  }
}
