//TRANG CHỦ HIỂN THỊ SẢN PHẨM

import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:Hades_Shops/consts.dart';
import 'package:Hades_Shops/pages/details_page.dart';
import 'package:Hades_Shops/models/T-shirt_model.dart';
import 'package:Hades_Shops/pages/my_favorite.dart';
import 'package:Hades_Shops/pages/mycart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 100, vsync: this); //di chuyen danh muc
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200], //blod nền
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 12, 0, 9), //color logo
          elevation: 700, //mờ nền logo
          title: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Hades ', //logo
              style: style.copyWith(
                  color: Color.fromARGB(255, 255, 0, 200),
                  fontSize: 24), //color text and size
            ),
          ),
          actions: [
            //phan thanh toán
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyCart())); //thanh thoán
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Thanh Toán',
                      style: style.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: bleu),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: favouriteitems.isNotEmpty
                    ? Badge(
                        badgeContent: Text(
                          favouriteitems.length.toString(),
                          style: style.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: white),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 249, 0, 0),
                          size: 28,
                        ),
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 5, 5, 5),
                        size: 28,
                      ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                  controller: _controller,
                  unselectedLabelStyle: style.copyWith(fontSize: 12),
                  labelStyle: style.copyWith(fontSize: 14),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(14), color: bleu),
                  unselectedLabelColor: Color.fromARGB(255, 255, 0, 200),
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'T-shirt',
                    ),
                    Tab(
                      text: 'Bottoms',
                    ),
                    Tab(
                      text: 'Outerwear',
                    ),
                  ]),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                //create menu
                child: TabBarView(controller: _controller, children: [
                  _buildlistitem(items: all), //Hiển thị khung sản phẩm tất cả
                  _buildlistitem(items: aothun), //Hiển thị khung sản phẩm
                  _buildlistitem(items: quandai), //Hiển thị khung sản phẩm
                  _buildlistitem(items: aokhoat), //Hiển thị khung sản phẩm
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistitem({required List<Clothingsamples> items}) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index));
        });
  }

  Widget _builditem(
      {required List<Clothingsamples> myitems, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(
                      item: myitems[index],
                    )));
      },
      child: AspectRatio(
        aspectRatio: 3 / 2.3,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: myitems[index].color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: Colors.grey, offset: Offset(0, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    myitems[index].img,
                    fit: BoxFit.cover,
                    width: 130,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          myitems[index].name,
                          style: style.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              myitems[index].isselected =
                                  !myitems[index].isselected;
                            });
                            myitems[index].isselected
                                ? favouriteitems.add(myitems[index])
                                : favouriteitems.remove(myitems[index]);
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color:
                                myitems[index].isselected ? Colors.red : white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Spacer(),
                    Text(
                      '${myitems[index].price} \đ',
                      style: style.copyWith(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      myitems[index].title,
                      style: style.copyWith(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
