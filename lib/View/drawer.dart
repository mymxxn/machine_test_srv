import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:machine_test_srv/Controller/home_controller.dart';
import 'package:machine_test_srv/Model/profile_model.dart';
import 'package:machine_test_srv/Utils/constants.dart';

class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      clipBehavior: Clip.none,
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
          image: DecorationImage(
            // scale: 2,
            alignment: Alignment.centerLeft,
            image: AssetImage(
              Constants.backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<HomeController>(
          builder: (_) {
            return ListView(
              children: [
                SizedBox(
                  height: 21,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.orange,
                          size: 18,
                        )),
                  ),
                ),
                Text("Hi,"),
                Text(
                  "${_.user.value.firstName ?? 'Name'} ${_.user.value.lastName ?? ''}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _.sideMenuList.length,
                    itemBuilder: (context, index) {
                      DataModel item = _.sideMenuList[index];
                      return sideMenu(
                          index: index,
                          lastIndex:
                              _.sideMenuList.indexOf(_.sideMenuList.last),
                          txt: "${item.englishName ?? ''}",
                          icon: Constants.events);
                    }),
                SizedBox(
                  height: 10,
                ),
                sideMenu(
                    index: 0,
                    lastIndex: 4,
                    txt: "Settings",
                    icon: Constants.settings),
                sideMenu(
                    index: 1,
                    lastIndex: 4,
                    txt: "Terms & Conditions",
                    icon: Constants.termsAndConditions),
                sideMenu(
                    index: 2,
                    lastIndex: 4,
                    txt: "Refund & Cancellation",
                    icon: Constants.refund),
                sideMenu(
                    index: 3,
                    lastIndex: 4,
                    txt: "App Info",
                    icon: Constants.appInfo),
                sideMenu(
                    index: 4,
                    lastIndex: 4,
                    txt: "Logout",
                    icon: Constants.logout)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget sideMenu(
      {required int index,
      required int lastIndex,
      required String txt,
      required String icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: index == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))
                      : index == lastIndex
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))
                          : null),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(child: Text(txt))
      ],
    );
  }
}
