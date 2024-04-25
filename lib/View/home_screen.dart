import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_srv/Controller/home_controller.dart';
import 'package:machine_test_srv/Model/data_list_model.dart';
import 'package:machine_test_srv/Utils/constants.dart';
import 'package:machine_test_srv/View/drawer.dart';
import 'package:machine_test_srv/View/pop_up_shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeScreenDrawer(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Constants.backgroundImage),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: SvgPicture.asset(Constants.menu)),
                ),
                SizedBox(
                    height: 25,
                    // width: 25,
                    child: Image.asset(
                      Constants.logo,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      Constants.notification,
                      fit: BoxFit.fill,
                    ))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              onChanged: (value) => homeController.filterDataList(value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                  isCollapsed: true,
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(12),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(
                      Constants.search,
                      fit: BoxFit.fill,
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints.loose(Size(35, 25))),
            ),
            SizedBox(
              height: 14,
            ),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (_) {
                  return _.isLoading.value
                      ? ShimmerDesign.popShimmer()
                      : _.filterList.isEmpty
                          ? Text("No Data")
                          : ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 12,
                                  ),
                              itemCount: _.filterList.length,
                              itemBuilder: (context, index) {
                                Datum item = _.filterList[index];
                                return Container(
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFd3e7e8),
                                            Color(0xFFF6FFFF),
                                            Color(0xFFECFAFB)
                                          ],
                                          stops: [
                                            0,
                                            50,
                                            100
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item.course?.name ?? ''}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        "${item.name ?? ''}")),
                                                Expanded(
                                                    child: Text(
                                                  "ID : ${item.uniqueId ?? ''}",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "${_.calculateDaysDifference(item.startDate ?? DateTime.now(), item.endDate ?? DateTime.now())} Days (${DateFormat('dd-MM-yyyy').format(item.startDate ?? DateTime.now())} to ${DateFormat('dd-MM-yyyy').format(item.endDate ?? DateTime.now())})",
                                              style: TextStyle(
                                                  color: Colors.grey.shade600),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("CSP : ${item.branch?.name}"),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Color(0xFFFFB6AC),
                                          Color(0xFF49C8FF)
                                        ], stops: [
                                          0,
                                          100
                                        ])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            iconLabel(Constants.attendance,
                                                "Attendance"),
                                            iconLabel(
                                                Constants.qfWork, "QF Work"),
                                            iconLabel(Constants.studentView,
                                                "Students View"),
                                            iconLabel(Constants.assessment,
                                                "Assessment")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                },
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: _buildItem(Constants.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildItem(Constants.batch),
            label: 'Batch',
          ),
          BottomNavigationBarItem(
            icon: _buildItem(Constants.profile),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: _buildItem(Constants.reports),
            label: 'Reports',
          ),
        ],
      ),
    );
  }

  Widget iconLabel(String img, String txt) {
    return Column(
      children: [
        SvgPicture.asset(img),
        SizedBox(
          height: 8,
        ),
        Text(
          txt,
          style: TextStyle(fontSize: 11),
        )
      ],
    );
  }

  Widget _buildItem(String icon) {
    return Stack(
      children: [
        SizedBox(
          height: 22,
          width: 22,
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ],
    );
  }
}
