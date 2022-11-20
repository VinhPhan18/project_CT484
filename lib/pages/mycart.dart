// ignore_for_file: unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:Hades_Shops/consts.dart';
import 'package:Hades_Shops/pages/checkout_page.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 40,
              color: Color.fromARGB(255, 255, 0, 200),
            ),
          ),
          backgroundColor: Color.fromARGB(0, 255, 250, 254),
          centerTitle: true,
          title: Text(
            'Giỏ hàng của tôi',
            style: style.copyWith(
              color: Color.fromARGB(228, 255, 0, 200),
              fontSize: 20,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: boughtitems.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: _screenheight * .7,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: boughtitems.length,
                              itemBuilder: (context, index) {
                                return index % 2 == 0
                                    ? BounceInLeft(
                                        child: _buildcartitem(index: index))
                                    : BounceInRight(
                                        child: _buildcartitem(index: index));
                              })),
                      const SizedBox(
                        height: 39,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: _screenwidth * .2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: red),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CheckoutPage(
                                                  cartModel: boughtitems,
                                                )));
                                  },
                                  child: Text(
                                    'Thanh toán',
                                    style: style.copyWith(
                                        color: white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Tổng cộng  =  $total \đ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: style.copyWith(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 0, 238)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                      'Không có sản phẩm',
                      style: style.copyWith(
                        color: Color.fromARGB(255, 255, 0, 200),
                        fontSize: 24,
                      ),
                    ),
                  )),
      ),
    );
  }

  Widget _buildcartitem({required int index}) {
    return Dismissible(
      key: Key(boughtitems[index].name),
      onDismissed: (dir) {
        setState(() {
          total = total - boughtitems[index].price;
          boughtitems.remove(boughtitems[index]);
        });
      },
      background: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 0, 200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.delete,
          color: Color.fromARGB(255, 21, 20, 21),
          size: 40,
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 0, 200), //color + -
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                color: Color.fromARGB(255, 255, 0, 200), //color viền giỏ hàng
                offset: Offset(0, 1),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: boughtitems[index].color),
                child: Image.asset(
                  boughtitems[index].img,
                  fit: BoxFit.cover,
                  width: 80,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    boughtitems[index].name,
                    maxLines: 1,
                    style: style.copyWith(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 0, 200),
                    ),
                  ),
                  Text(
                    '${boughtitems[index].price} \đ',
                    maxLines: 1,
                    style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 0, 200),
                    ),
                  ),
                  Text(
                    'Số lượng : ${boughtitems[index].items}',
                    style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 0, 200),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _additems(
                  item: boughtitems[index].items,
                  index: index,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Size:${boughtitems[index].size}',
                  maxLines: 1,
                  style: style.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 0, 200),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _additems({required int item, required int index}) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              final originalprice =
                  boughtitems[index].price / boughtitems[index].items;

              boughtitems[index].items++;

              boughtitems[index].price =
                  originalprice * boughtitems[index].items;
              total = total + originalprice;
            });
          },
          child: Text('+',
              style: style.copyWith(
                fontSize: 20,
              )),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color.fromARGB(255, 255, 0, 200),
          ),
          child: Text(item.toString(),
              style: style.copyWith(
                fontSize: 12,
              )),
        ),
        InkWell(
          onTap: () {
            setState(() {
              final originalprice =
                  boughtitems[index].price / boughtitems[index].items;

              if (boughtitems[index].items > 1) {
                boughtitems[index].items--;
                boughtitems[index].price =
                    boughtitems[index].price - originalprice;

                total = total - originalprice;
              }
            });
          },
          child: Text('-',
              style: style.copyWith(fontSize: 20, fontWeight: FontWeight.w900)),
        ),
      ],
    );
  }
}
