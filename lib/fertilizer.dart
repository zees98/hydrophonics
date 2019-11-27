import 'package:flutter/material.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/sizeconfig.dart';

Map<String, String> ammoniumSulphate = {
  'Total Nitrogen (N)': '21%',
  'Sulfur (S)': '24%',
  'Formula': '(NH4)2SO4',
  'Appearance': 'White Crystal or granular',
  'Solubility (in20 c)': '744 g/L',
  'Density': '1.77 g/cm3',
  'Molar Mass': '132.14 g/mol'
};

Map<String, String> calciumNitrate = {
  'Total Nitrogen (N)': '15%',
  'Calcium (Ca)': '19%',
  'Formula': 'Ca(NO3)2',
  'Appearance': 'White solid hygroscopic granules',
  'Solubility (in20 c)': '1,212 g/L',
  'Density': '2.5 g/cm3',
  'Molar Mass': '164.09 g/mol'
};

Map<String, String> mgSulphate = {
  'Magnesium (Mg)': '16%',
  'Sulfur (S)': '13%',
  'Formula': 'MgSO4',
  'Appearance': 'White crystalline solid',
  'Solubility (in20 c)': '1,130 g/L',
  'Density': '1.512 g/cm3',
  'Molar Mass': '246.47 g/mol'
};
Map<String, String> monoPotassiumPhosphate = {
  'Phosphorus (P)': '22.7%',
  'Potassium (K)': '28.2%',
  'Formula': 'KH2PO4',
  'Appearance': 'White crystal powder',
  'Solubility (in20 c)': '226 g/L',
  'Density': '2.34 g/cm3',
  'Molar Mass': '136.1 g/mol'
};
Map<String, String> potassiumNitrate = {
  'Total Nitrogen (N)': '13%',
  'Potassium (K)': '46%',
  'Formula': 'KNO3',
  'Appearance': 'White crystalline powder',
  'Solubility (in20 c)': '242 g/L',
  'Density': '2.109 g/cm3 ',
  'Molar Mass': '101.1 g/mol',
};
Map<String, String> potassiumSulphate = {
  'Potassium (K)': '50%',
  'Sulphate (S)': '18%',
  'Formula': "	K2SO4",
  'Appearance': 'White fine crystalline powder',
  'Solubility (in20 c)': '120 g/L ',
  'Density': "	2.66 g/cm3",
  'Molar Mass': '174.26 g/mol',
};

class Fertilizer extends StatefulWidget {
  @override
  _FertilizerState createState() => _FertilizerState();
}

class _FertilizerState extends State<Fertilizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppLocalizations.of(context).fertilizer),
        centerTitle: true,
        actions: <Widget>[Image.asset("assets/app_logo.png")],
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    ExTile(title: 'Ammonium Sulphate', map: ammoniumSulphate),
                    ExTile(title: 'Calcium Nitrate', map: calciumNitrate),
                  
                    ExTile(title: 'Magnesium Sulphate (Heptahydrate)',map: mgSulphate),
                    ExTile(title: 'Mono Potassium Phosphate',map: monoPotassiumPhosphate),
                    ExTile(title: 'Potassium Nitrate', map: potassiumNitrate),
                    ExTile(title: 'Potassium Sulphate', map: potassiumSulphate)
                  ],
                )),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text("www.BasilGarden.net")),
          ],
        ),
      ),
    );
  }
}

class ExTile extends StatelessWidget {
  final Map<String, String> map;
  final title;
  const ExTile({
    Key key,
    this.map,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> fertilizer = Translations.fertilizers(context);
    return Card(
      color: Colors.black54,
      child: ExpansionTile(
        title: Text(fertilizer[title]),
        children: <Widget>[
          FertilizerTable(
            title: fertilizer[title],
            map: map,
          ),
        ],
      ),
    );
  }
}

class FertilizerTable extends StatelessWidget {
  final Map<String, String> map;
  final title;
  const FertilizerTable({
    Key key,
    this.map,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: (32 / 774) * SizeConfig.screenHeight,
                    fontFamily: 'OpenSans',
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        DataTable(
          columnSpacing: 40,
          columns: ['', '', ''].map((val) {
            return DataColumn(label: Text(val));
          }).toList(),
          rows: map.keys.toList().map((val) {
            final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
           Map<String, String > chem = Translations.fertilizerChem(context);
           Map<String, String > detail = Translations.details(context);
            return DataRow(
                cells: [
              Image.asset(
                  'assets/fertilizer/${val.trim().replaceAll(" ", "")}.png'),
              Text(chem[val] == null? val : chem[val]),
              Text(detail[map[val]] == null ?  map[val]: detail[map[val]] )
              //Text(alphanumeric.hasMatch(map[val])? map[val] : fertilizer[val])
            ].map((val) {
              return DataCell(val);
            }).toList());
          }).toList(),
        )
      ],
    );
  }
}
