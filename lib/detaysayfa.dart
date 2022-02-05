import 'package:flutter/material.dart';
import 'yemekler.dart';


class DetaySayfa extends StatefulWidget {

 late Yemekler yemek;

  DetaySayfa(this.yemek);

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.yemek.yemekAdi),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(

                  width: 400,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Image.asset("resimler/${widget.yemek.yemekResimAdi}"),
                  )),
              Text("${widget.yemek.fiyat}\u{20BA}"),

              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed:(){
                  print("${widget.yemek.yemekAdi} siparişiniz alındı");
                  },
                    child: Text("Sipariş ver")),

              )
            ],
          ),
        )

    );
  }
}
