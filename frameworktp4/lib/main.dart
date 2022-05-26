import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framework4',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(
          title: 'Calcul Du Salaire Brut En Net -Version Marine-'),
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
  //Somme d'argent de base
  static const defautArgent = 0.0;

  // Cette partie servira à modifier la valeur de base
  final _controleSommeArgent =
  TextEditingController(text: defautArgent.toString());

  double _argent = defautArgent;
  int _valStatut = 22;
  int _valMois = 12;

//----------------------------------------
  String _getHoraireNet() {
    double horaireNet = calculNet(_argent!, _valStatut.toDouble());
    return horaireNet.toString();
  }

  String _getMensuelBrut() {
    double mensuelBrut = _argent! * 152;
    return mensuelBrut.toString();
  }

  String _getMensuelNet() {
    double mensuelNet = calculNet(_argent!, _valStatut.toDouble());
    mensuelNet = mensuelNet * 152;
    return mensuelNet.toString();
  }

  String _getAnnuelBrut() {
    double annuelBrut = _argent * 152 * _valMois;
    return annuelBrut.toString();
  }

  String _getAnnuelNet() {
    double annuelNet = calculNet(_argent!, _valStatut.toDouble());
    annuelNet = annuelNet * 152 * _valMois;
    return annuelNet.toString();
  }

  double calculNet(double argent, double statut) {
    return roundDouble(argent * (1 - statut / 100), 2);
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void _calcStatut(int? value) {
    setState(() {
      _valStatut = value ?? 0;
    });
  }

  void _calcPrime(int? value) {
    setState(() {
      _valMois = value ?? 0;
    });
  }

//----------------------------------------

  double _valueTravail = 40.0;
  double _valuePrelevement = 40.0;
  //--------------------------

  @override
  void initState() {
    super.initState();
    _controleSommeArgent.addListener(_changementArgent);
  }

  _changementArgent() {
    setState(() {
      _argent = double.tryParse(_controleSommeArgent.text) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcul Du Salaire Brut En Net -Version Marine-',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20.0),

            TextFormField(
              key: Key("horaireBrut"),
              controller: _controleSommeArgent,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Horaire brut',
                labelStyle: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                  borderSide: new BorderSide(),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //------------------------------------------
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.red),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Horaire net : ${_getHoraireNet()} €',
                        key: Key('horaireNet'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.orange),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Mensuel brut : ${_getMensuelBrut()} €',
                        key: Key('mensuelbrut'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.yellow),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Mensuel net : ${_getMensuelNet()} €',
                        key: Key('mensuelNet'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.green),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Annuel brut : ${_getAnnuelBrut()} €',
                        key: Key('annuelBrut'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Annuel net : ${_getAnnuelNet()} €',
                        key: Key('annuelNet'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.purple),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text('Sélectionnez votre statut : '),
                  ListTile(
                    leading: Radio(
                      value: 22,
                      groupValue: _valStatut,
                      onChanged: _calcStatut,
                    ),
                    title: const Text('Salarié non-cadre'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 25,
                      groupValue: _valStatut,
                      onChanged: _calcStatut,
                    ),
                    title: const Text('Salarié cadre'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 15,
                      groupValue: _valStatut,
                      onChanged: _calcStatut,
                    ),
                    title: const Text('Fonction publique'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 45,
                      groupValue: _valStatut,
                      onChanged: _calcStatut,
                    ),
                    title: const Text('Profession libérale'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 51,
                      groupValue: _valStatut,
                      onChanged: _calcStatut,
                    ),
                    title: const Text('Portage salarial'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            const Text('Sélectionnez votre temps de travail : '),
            SfSlider(
              min: 0.0,
              max: 100.0,
              value: _valueTravail,
              stepSize: 10,
              interval: 10,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _valueTravail = value;
                });
              },
            ),

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.pink),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                      'Sélectionnez le nombre de mois de prime conventionnelle :'),
                  ListTile(
                    leading: Radio(
                      value: 12,
                      groupValue: _valMois,
                      onChanged: _calcPrime,
                    ),
                    title: const Text('12 Mois'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 13,
                      groupValue: _valMois,
                      onChanged: _calcPrime,
                    ),
                    title: const Text('13 mois'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 14,
                      groupValue: _valMois,
                      onChanged: _calcPrime,
                    ),
                    title: const Text('14 mois'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 15,
                      groupValue: _valMois,
                      onChanged: _calcPrime,
                    ),
                    title: const Text('15 mois'),
                  ),
                  ListTile(
                    leading: Radio(
                      value: 16,
                      groupValue: _valMois,
                      onChanged: _calcPrime,
                    ),
                    title: const Text('16 mois'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            const SizedBox(height: 20.0),

            const Text('Sélectionnez le taux de prélévement à la source : '),
            SfSlider(
              min: 0.0,
              max: 43.0,
              value: _valuePrelevement,
              stepSize: 0.5,
              interval: 10,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _valuePrelevement = value;
                });
              },
            ),
            const SizedBox(height: 40.0),

            const Text(
                'Estimation de votre salaire net après le prélèvement à la source : '),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.yellow),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Mensuel net après impôts : ${_getHoraireNet()} €',
                        key: Key('mensuelNetApresImpots'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.purple),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Annuel net après impôts : ${_getMensuelBrut()} €',
                        key: Key('annuelNetApresImpots'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controleSommeArgent.dispose();
    super.dispose();
  }
}

class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
      this.text, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20)),
    );
  }
}
