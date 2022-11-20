import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:Hades_Shops/consts.dart';
import 'package:Hades_Shops/models/cart_model.dart';
import 'package:Hades_Shops/pages/myhomepage.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> cartModel;
  const CheckoutPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var isloading = false;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: bleu,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
            ),
          ),
        ),
        body: Container(
          color: bleu,
          width: _screenwidth,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      color: white,
                      width: _screenwidth * .8,
                      height: _screenheight * .7,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 80,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Hades Shop',
                              style: style.copyWith(
                                  color: Color.fromARGB(255, 255, 0, 200),
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              // ignore: unnecessary_string_escapes
                              'Thanh Toán',
                              maxLines: 1,
                              style: style.copyWith(
                                  color: Color.fromARGB(255, 255, 0, 200),
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  Text(
                                    DateTime.now().toString().substring(0, 16),
                                    style: style.copyWith(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 255, 0, 200),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Chi tiết',
                                    style: style.copyWith(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 255, 0, 200),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                flex: 2,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.cartModel.length,
                                    itemBuilder: (context, index) {
                                      return _builditems(
                                          name: widget.cartModel[index].name,
                                          price: widget.cartModel[index].price,
                                          items: widget.cartModel[index].items);
                                    })),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildbutton(_screenheight, _screenwidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildbutton(double _screenheight, _screenwidth) {
    return Expanded(
      child: Container(
        width: _screenwidth * .7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white), //bo goc đặt hàng
        child: MaterialButton(
          onPressed: () {
            setState(() {
              isloading = true;
            });
            Future.delayed(const Duration(seconds: 3)).then((value) {
              setState(() {
                isloading = false;
              });
              _buildawesomedialog();
            });
          },
          child: (isloading)
              ? const CircularProgressIndicator()
              : Text(
                  'Đặt hàng',
                  style: style.copyWith(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 0, 200),
                  ),
                ),
        ),
      ),
    );
  }

  _buildawesomedialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            title: 'Đặt hàng thành công',
            btnOkText: 'Chúng tôi sẽ sớm liên hệ với bạn',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              boughtitems.clear();

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const MyHomePage()));
            },
            btnOkColor: Color.fromARGB(255, 255, 0, 200),
            buttonsBorderRadius: BorderRadius.circular(20))
        .show();
  }

  Widget _builditems(
      {required String name, required double price, required int items}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Text(
            items > 1 ? '$name * $items' : name,
            style: style.copyWith(
              fontSize: 14,
              color: Color.fromARGB(255, 255, 0, 200),
            ),
          ),
          const Spacer(), //phan thanh toan ao thun
          Text(
            '$price\đ',
            style: style.copyWith(
              fontSize: 14,
              color: Color.fromARGB(255, 255, 0, 200),
            ),
          )
        ],
      ),
    );
  }
}
