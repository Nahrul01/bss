import 'package:bss/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imgList = [
                        Image.asset('assets/1.jpg'),
                        Image.asset('assets/2.jpg'),
                        Image.asset('assets/3.jpg'),];

  final List<Widget> textlist = [
                      Column(
                        children: const [ 
                        Text('Solusi Parkir & Valet',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                            SizedBox( height: 10,),
                        Text('Optimalkan Potensi penambahan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                        Text('Pendapatan titik parkir anda',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                      ]),
                      Column(
                        children: const [ 
                        Text('bla',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                            SizedBox( height: 10,),
                        Text('Optimalkan Potensi penambahan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                        Text('Pendapatan titik parkir anda',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                      ]),
                      Column(
                        children: const [ 
                        Text('bli',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                            SizedBox( height: 10,),
                        Text('Optimalkan Potensi penambahan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                        Text('Pendapatan titik parkir anda',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black)),
                      ]),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox( height: 40,),
        CarouselSlider(
          items: imgList,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
              ), 
        ),
        const SizedBox( height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()),
                    );}, 
            child: const Text('Parking',
            style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 100),
              primary: Colors.pink,
            ),),
            const SizedBox(width: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Valet',
             style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 100),
              primary: Colors.blue.shade900,),
        ),]),
        const SizedBox(height: 20,)
      ]),
    );
  }
}