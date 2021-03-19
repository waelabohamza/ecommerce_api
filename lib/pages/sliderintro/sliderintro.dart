import 'package:ecommerce_api/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_api/main.dart';

class SliderIntro extends StatefulWidget {
  SliderIntro({Key key}) : super(key: key);

  @override
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  int currentpage = 0;
  List listintro;
  var lang = mySharedPreferences.getString("lang");

  @override
  void initState() {
    if (lang.toString() == "ar") {
      listintro = [
        {
          "text": "مرحبا بكم في تطبيق امازون",
          "image": "assets/images/splash_1.png"
        },
        {
          "text":
              "نحن نساعدك على الاتصال مع المتاجر \n حول الولايات المتحدة الامريكية",
          "image": "assets/images/splash_2.png"
        },
        {
          "text": "نحن نعرض لك طريقة سهلة \n للتسوق فقط تبقى في بيتك ",
          "image": "assets/images/splash_3.png"
        },
      ];
    } else {
      listintro = [
        {
          "text": "Welcome to Tokoto, Let’s shop!",
          "image": "assets/images/splash_1.png"
        },
        {
          "text":
              "We help people conect with store \naround United State of America",
          "image": "assets/images/splash_2.png"
        },
        {
          "text": "We show the easy way to shop. \nJust stay at home with us",
          "image": "assets/images/splash_3.png"
        },
      ];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: PageView.builder(
                  onPageChanged: (val) {
                    setState(() {
                      currentpage = val;
                    });
                  },
                  itemCount: listintro.length,
                  itemBuilder: (context, i) {
                    return TextAndImage(list: listintro[i], mdw: mdw , lang : lang );
                  })),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(listintro.length,
                          (index) => buildControlPageView(index))),
                  Spacer(
                    flex: 5,
                  ),
                  Text(" ${mySharedPreferences.getString('lang')} "),
                  MyButton(
                    title: "متابعة",
                    function: () {},
                    mdw: mdw,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ))
        ],
      )),
    );
  }

  AnimatedContainer buildControlPageView(index) {
    return AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 1),
        duration: Duration(milliseconds: 500),
        width: currentpage == index ? 20 : 5,
        height: 5,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(2.5)));
  }
}

class TextAndImage extends StatelessWidget {
  final list;
  final mdw;
  final lang  ; 
  const TextAndImage({Key key, this.list, this.mdw , this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: mdw / 6),
            child: lang == "ar" ?  Text(
              "متجر",
              style: Theme.of(context).textTheme.headline4,
            ) :  Text(
              "Ecommerce",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(height: 30),
          Container(child: Text("${list['text']}")),
          SizedBox(height: 20),
          Image.asset(
            "${list['image']}",
            width: mdw / 1.5,
          )
        ],
      ),
    );
  }
}
