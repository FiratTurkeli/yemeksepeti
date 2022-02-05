import 'package:flutter/material.dart';
import 'yemekler.dart';
import '../detaysayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YemekSepeti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  MyHomePage(title: ("Yemek Sepeti")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async {

   var yemekListesi = <Yemekler>[];

   var y1 = Yemekler(1, "Köfte", 19.90 , "kofte.png");
   var y2 = Yemekler(2, "Corba", 7.90, "corba.png");
   var y3 = Yemekler(3, "Ayran", 3.90, "ayran.jpg");
   var y4 = Yemekler(4, "Kola", 4.90, "kola.jpg");

   yemekListesi.add(y1);
   yemekListesi.add(y2);
   yemekListesi.add(y3);
   yemekListesi.add(y4);

   return yemekListesi;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot){
         if(snapshot.hasData){

           var yemekListesi = snapshot.data;

           return ListView.builder(
               itemCount: yemekListesi!.length,
               itemBuilder:(context,indeks){
                 var yemek = yemekListesi[indeks];

                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek)));
                   },
                   child: Card(
                     child: Row(
                       children: [
                         SizedBox(
                             height: 100,
                             width: 100,
                             child: Image.asset("resimler/${yemek.yemekResimAdi}")),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                             Text("${yemek.yemekAdi}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                             SizedBox(height: 40,),
                             Text("${yemek.fiyat.toString()}\u{20BA}", style: TextStyle(fontSize: 15, color: Colors.blue),),
                           ],
                           ),
                         ),
                         Spacer(),
                         Icon(Icons.arrow_right)
                       ],
                     ),
                   ),
                 );
               },
           );
         }else{
          return Center();

         }

        },
      )

    );
  }
}
