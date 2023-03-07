// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/Model/Currency.dart';

void main() {
  runApp(MyGame());
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      theme: ThemeData(
          fontFamily: 'dana',
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              bodyText1: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              headline2: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              Image.asset("assets/images/icon.png"),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'قیمت به روز ارز',
                    style: TextStyle(color: Colors.black),
                  )),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/menu.png'))),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/q.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text('نرخ ارز آزاد چیست؟ ',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                    style: TextStyle(color: Colors.black),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 130, 130, 130),
                        borderRadius: BorderRadius.all(Radius.circular(1000))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('نام آزاد ارز',
                            style: TextStyle(color: Colors.white)),
                        Text('قیمت', style: TextStyle(color: Colors.white)),
                        Text('تغییر', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  MyItem(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 232, 232),
                          borderRadius: BorderRadius.circular(1000)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextButton.icon(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1000))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 202, 193, 255))),
                                onPressed: () => _snackBar(
                                    context, 'بروزرسانی با موفقیت انجام شد'),
                                icon: Icon(CupertinoIcons.refresh_bold,
                                    color: Colors.black),
                                label: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text('بروزرسانی',
                                      style: TextStyle(color: Colors.black)),
                                )),
                          ),
                          Text('اخرین بروزرسانی در ساعت${_gettime()}'),
                          SizedBox(width: 8)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _snackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: Colors.green));
  }

  String _gettime() {
    return '20:45';
  }
}

class MyItem extends StatelessWidget {
   MyItem({
    super.key,
  });
  List<Currency>currency = [];


  @override
  Widget build(BuildContext context) {

    currency.add(Currency(id:'1', title: 'دلار استرالیا', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار امریکا', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار لبنان', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار روسیه', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار استرالیا', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار استرالیا', price: '1000', changes: '+2', status: 'p'));
    currency.add(Currency(id:'1', title: 'دلار استرالیا', price: '1000', changes: '+2', status: 'p'));
    return Container(
        height: 350,
        width: double.infinity,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(blurRadius: 1.0, color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(currency[0].title!,
                          style: TextStyle(color: Colors.black)),
                      Text(currency[0].price!, style: TextStyle(color: Colors.black)),
                      Text(currency[0].changes!, style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              );
            }));
  }
}
