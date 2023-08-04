import 'package:flutter/material.dart';
import 'package:flutter_web_daum_postcode/model/postcode.dart';
import 'package:flutter_web_daum_postcode/pages/postcode_web_view.dart';
import 'package:flutter_web_daum_postcode/pages/widgets/part_postcode_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostcodeModel? postcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web Daum Postcode'),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostcodeWebView();
            })).then((value) {
              if (value != null) {
                setState(() {
                  postcode = value;
                });
              }
            }),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('Get Postcode'),
          ),
          SizedBox(height: 32.0),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            children: [
              if (postcode != null) ...[
                PostcodeText(title: "Address", content: postcode!.address),
                PostcodeText(
                    title: "Road Address", content: postcode!.roadAddress),
                PostcodeText(
                    title: "Jibun Address", content: postcode!.jibunAddress),
                PostcodeText(title: "Sido", content: postcode!.sido),
                PostcodeText(title: "Sigungu", content: postcode!.sigungu),
                PostcodeText(title: "B Name", content: postcode!.bname),
                PostcodeText(title: "Road Name", content: postcode!.roadname),
                PostcodeText(
                    title: "Building Name", content: postcode!.buildingName),
                PostcodeText(
                    title: "Address(EN)", content: postcode!.addressEnglish),
                PostcodeText(
                    title: "Road Address(EN)",
                    content: postcode!.roadAddressEnglish),
                PostcodeText(
                    title: "Jibun Address(EN)",
                    content: postcode!.jibunAddressEnglish),
                PostcodeText(title: "Sido(EN)", content: postcode!.sidoEnglish),
                PostcodeText(
                    title: "Sigungu(EN)", content: postcode!.sigunguEnglish),
                PostcodeText(
                    title: "B Name(EN)", content: postcode!.bnameEnglish),
                PostcodeText(
                    title: "Road Name(EN)", content: postcode!.roadnameEnglish),
                PostcodeText(title: "Zonecode", content: postcode!.zonecode),
                PostcodeText(
                    title: "Sigungu Code", content: postcode!.sigunguCode),
                PostcodeText(title: "B Code", content: postcode!.bcode),
                PostcodeText(
                    title: "Building Code", content: postcode!.buildingCode),
                PostcodeText(
                    title: "Roadname Code", content: postcode!.roadnameCode),
                PostcodeText(
                    title: "Address Type", content: postcode!.addressType),
                PostcodeText(title: "Apertment", content: postcode!.apartment),
                PostcodeText(
                    title: "User Language Type",
                    content: postcode!.userLanguageType),
                PostcodeText(
                    title: "User Selected Type",
                    content: postcode!.userSelectedType),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
