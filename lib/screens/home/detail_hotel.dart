
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hotel Sweet Home',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundpastel.jpg'),
            fit: BoxFit.fill,
            scale: 1,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(image: AssetImage('assets/images/hotel.jpg'),height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.sizeOf(context).width*0.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Text('        โรงแรมนี้ได้รับการรับรองจากสมาคม illuminatic แล้วว่าเป็นโรงแรมที่ดีมากๆ '
                      'ซึ่งทางเราภูมิใจนำเสนอห้องพักของเรามีเตียง 2 เตียง 20 ห้องน้ำ ห้องลับอีก 1 ห้อง '
                      'ให้คุณไปทำภารกิจกอบกู้จักรวาลได้ทุกวัน เพียงราคา 199 บาทเท่านั้น!! นอกจากนี้ทางเรายังมีพนักงานจากองกรณ์ลับ G.I.J.O.E '
                      'คอยให้บริการอาหาร และทำความสะอาดถึงห้องของลูกค้า ซึ่งลูกค้าสามารถเรียกได้ทุกเมื่ออีกด้วย นอกจากนี้ด้านนอกยัง'
                      'มีบริการรถจาก Fast & Furious ที่คุณยังสามารถขับไปผาดโผนได้ตลอดเวลา ทำให้'
                      'คุณไปถึงเป้าหมายได้ทันเวลาอีกด้วย ซึ่งไม่เสียค่าบริการเลย ส่วนด้านนอกนั้นเรายังมีสวน'
                      'ที่มีมังกรจากป่าหิมพานต์ให้คุณไปถ่ายรูป ให้อาหาร และยังสามารถขึ้นไปขี่ได้'
                      'ตลอดเวลาเลยอีกด้วย'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Column(
                        children: [
                          Text(
                              'สนใจพักติดต่อ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )
                          ),
                          Text(
                              'เบอร์โทรศัพท์:099-871-5648',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )
                          ),
                          Text(
                              'Facebook:Hotel Sweet Home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )
                          ),
                          Text(
                              'Ig:Hotel Sweet Home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}