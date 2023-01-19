import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:reportingapp1/components/networkConnection.dart';
import 'package:reportingapp1/screen/companyRegistration.dart';
import 'package:reportingapp1/components/commonColor.dart';
import 'package:reportingapp1/screen/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? cid;
  String? st_uname;
  String? st_pwd;

  navigate() async {
    await Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      cid = prefs.getString('cid');

      Navigator.push(
          context,
          PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) {
                if (cid != null) {
                  return HomeScreen();
                } else {
                  return RegistrationScreen();
                }
              }));
    });
  }

  shared() async {
    var status = await Permission.storage.status;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // fp = prefs.getString("fp");
    // print("fingerPrint......$fp");

    // if (com_cid != null) {
    //   Provider.of<AdminController>(context, listen: false)
    //       .getCategoryReport(com_cid!);
    //   Provider.of<Controller>(context, listen: false).adminDashboard(com_cid!);
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // NetConnection.networkConnection(context).then((value) async {
    //   if (value == true) {
    Provider.of<Controller>(context, listen: false).getInitializeApi(context);
    // Provider.of<Controller>(context, listen: false).setMenuClick(false);
    //   }
    // });

    shared();
    navigate();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(
          "Vega Reports",
          style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: P_Settings.purple),
        ),
      ),
    );
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: P_Settings.sumColor,
    //   body: InkWell(
    //     onTap: () {
    //       FocusScope.of(context).requestFocus(FocusNode());
    //     },
    //     child: Center(
    //         child: Column(
    //       children: [
    //         SizedBox(
    //           height: size.height * 0.4,
    //         ),
    //         Container(
    //             height: 200,
    //             width: 200,
    //             child: Image.asset(
    //               "asset/logo_black_bg.png",
    //             )),
    //       ],
    //     )),
    //   ),
    // );
  }
}