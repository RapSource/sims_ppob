import 'package:flutter/material.dart';

class PemmbayaranPage extends StatefulWidget {
  const PemmbayaranPage({super.key});

  @override
  State<PemmbayaranPage> createState() => _PemmbayaranPageState();
}

class _PemmbayaranPageState extends State<PemmbayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 110,
          leading: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25.0,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop()),
              Text('Kembali',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))
            ],
          ),
          title: Container(
            margin: const EdgeInsets.only(left: 45),
            child: Text('PemByaran',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saldo Anda',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    const Text('Rp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 5),
                    Text('10.000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600)),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text('PemBayaran', style: TextStyle(fontSize: 18.0)),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/Listrik.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 5),
                const Text('Listrik Prabayar',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 25),
            TextField(
                // controller: _nominalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.money),
                ),
              ),
            const SizedBox(height: 200),
            MaterialButton(
              color: Colors.red,
              textTheme: ButtonTextTheme.primary,
              height: 50,
              onPressed: () {},
              child: const Text('Bayar'),
            )
          ],
        ),
      ),
    );
  }
}
