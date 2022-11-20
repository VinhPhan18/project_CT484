//Trang tạo danh mục và hiển thị sản phẩm
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Hades_Shops/models/cart_model.dart';
import 'package:Hades_Shops/models/T-shirt_model.dart';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30,
    fontStyle: FontStyle.normal, //Font style normal,italic font nghieng
    color: Color.fromARGB(255, 252, 248, 249), //color text
    fontWeight: FontWeight.w900); //Độ đậm của chữ
const Color bleu = Color.fromARGB(255, 255, 20, 220); //Màu khung danh mục
const Color red = Color.fromARGB(216, 255, 9, 222); //màu khung sản phẩm
const Color white = Color.fromARGB(255, 255, 255, 255); //màu sản heart

List<Clothingsamples> aothun = [
  //create áo thun
  Clothingsamples(
    name: 'Áo Thun',
    img: '../assets/images/aothun1.jpg',
    title: 'Regular fit Thiết kế và sản xuất bởi HADES.',
    price: 345000,
    isselected:
        false, //Thuộc tính chọn hay không chọn, mặc định false là không chọn
    color: bleu,
    height: 10,
    width: 10,
  ),
];

//create quan dai
List<Clothingsamples> quandai = [
  Clothingsamples(
    name: 'Quần dài',
    img: '../assets/images/quandai.jpg',
    title: ' Regular fit Thiết kế và sản xuất bởi HADES.',
    price: 345000,
    isselected:
        false, //Thuộc tính chọn hay không chọn, mặc định false là không chọn
    color: bleu,
    height: 10,
    width: 10,
  ),
];
//create ao khoat
List<Clothingsamples> aokhoat = [
  Clothingsamples(
    name: 'Áo khoát',
    img: '../assets/images/aothun1.jpg',
    title: 'Regular fit Thiết kế và sản xuất bởi HADES.',
    price: 345000,
    isselected:
        false, //Thuộc tính chọn hay không chọn, mặc định false là không chọn
    color: bleu,
    height: 10,
    width: 10,
  ),
];
//hien thi danh muc
List<Clothingsamples> all = aothun + quandai + aokhoat;

List sizes = [1, 2, 3, 4];

List<CartModel> boughtitems = [];
List<Clothingsamples> favouriteitems = [];

double total = 0.00;
