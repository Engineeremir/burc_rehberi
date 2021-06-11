import 'package:burc_rehberi/constants/constants_init.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'burc_detay.dart';
import 'burc_liste.dart';

class BurcDetayState extends State<BurcDetay> {
  Burc? secilenBurc;
  Color? baskinRenk;
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/" + secilenBurc!.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator!.dominantColor!.color.toString());

      setState(() {
        baskinRenk = paletteGenerator!.vibrantColor!.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : customColors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/" + secilenBurc!.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenBurc!.burcAdi + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenBurc!.burcDetay,
                  style: TextStyle(fontSize: 18, color: customColors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PaletteGenerator>('paletteGenerator', paletteGenerator));
  }
}
