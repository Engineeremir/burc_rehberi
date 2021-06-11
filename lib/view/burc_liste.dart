import 'package:burc_rehberi/constants/constants_init.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utilities/strings.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar = [];

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiGetir();

    return Scaffold(
      appBar: AppBar(
        title: Text(customStrings.title),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiGetir() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
        Strings.BURC_ADLARI[i],
        Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i],
        kucukResim,
        buyukResim,
      );
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return tekSatirBurc(context, index);
        },
        itemCount: tumBurclar.length);
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oAnEklenecekBurc = tumBurclar[index];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: ()=>Navigator.pushNamed(context, "/burcDetay/$index"),
          leading: Image.asset(
            "assets/images/" + oAnEklenecekBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            oAnEklenecekBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: customColors.pink),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              oAnEklenecekBurc.burcTarih,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: customColors.black),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: customColors.pink,
          ),
        ),
      ),
    );
  }
}
