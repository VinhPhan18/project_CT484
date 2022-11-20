import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:Hades_Shops/consts.dart';
import 'package:Hades_Shops/pages/details_page.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(141, 242, 242, 242),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 40,
              color: Color.fromARGB(255, 255, 0, 200), //icon back
            ),
          ),
          backgroundColor: Color.fromARGB(0, 255, 250, 250),
          centerTitle: true,
          title: Text(
            'Sản phẩm yêu thích',
            style: style.copyWith(
              color: Color.fromARGB(255, 255, 0, 200),
              fontSize: 18,
            ),
          ),
          elevation: 100, //độ mờ thanh
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: favouriteitems.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: _screenheight * .6,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: favouriteitems.length,
                              itemBuilder: (context, index) {
                                return index % 2 == 0
                                    ? BounceInRight(
                                        child: _buildfavoriteitem(index: index))
                                    : BounceInLeft(
                                        child:
                                            _buildfavoriteitem(index: index));
                              })),
                    ],
                  )
                : Center(
                    child: Text(
                      'Không có sản phẩm yêu thích',
                      style: style.copyWith(
                        color: Color.fromARGB(255, 255, 0, 200),
                        fontSize: 18,
                      ),
                    ),
                  )),
      ),
    );
  }

  Widget _buildfavoriteitem({required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsPage(item: favouriteitems[index])))
            .then((value) {
          setState(() {});
        });
      },
      child: Container(
        padding: const EdgeInsets.all(9), //bo vien anh
        margin: const EdgeInsets.symmetric(
            vertical: 10), //khoang cách từ trên xuống
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20), //bo vien
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(255, 255, 0, 200),
                offset: Offset(
                  2,
                  2,
                ), //vien khung yeu thich
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(0), //bo vien san pham yeu thích
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1), //bo tron khung
                    color: favouriteitems[index].color),
                child: Image.asset(
                  favouriteitems[index].img,
                  fit: BoxFit.cover,
                  width: 100,
                )),
            const SizedBox(
              width: 10, //khhoang cách chu
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouriteitems[index].name,
                  maxLines: 1,
                  style: style.copyWith(
                      fontSize: 22,
                      color: Color.fromARGB(255, 255, 0, 217)), //color title
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${favouriteitems[index].price}\đ', //gia tien
                  maxLines: 1,
                  style: style.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 0, 217)), //color tien
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  favouriteitems[index].isselected =
                      false; //niếu sản phẩm không yêu thích thực hiện xóa khỏi giỏ hàng
                  favouriteitems
                      .remove(favouriteitems[index]); //xoa khoi gio hàng
                });
              },
              child: const Icon(
                Icons.favorite_sharp,
                color: red,
                size: 40, //size heart
              ),
            )
          ],
        ),
      ),
    );
  }
}
