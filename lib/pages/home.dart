import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(children: [
            Image.asset(
              'assets/Logo.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 5.0),
            const Text('SIMS PPOB',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))
          ]),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Image.asset('assets/Profile Photo.png')),
          ]),
      body: Container(
        margin: const EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Selamat Datang,', style: TextStyle(fontSize: 22)),
            const Text('Kristianto Wibowo',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              height: 160,
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
                    Text(isVisible ? ' 80.000' : ' ● ● ● ● ● ● ●',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isVisible ? 28.0 : 18.0,
                            fontWeight: FontWeight.w600)),
                  ]),
                  Row(children: [
                    const Text(
                      'Lihat Saldo',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          size: 18,
                        )),
                  ])
                ],
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Image.asset('assets/PBB.png'), Text('PBB')],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/Listrik.png'),
                        Text('Listrik')
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/Pulsa.png'),
                        Text('Pulsa')
                      ],
                    ),
                    Column(
                      children: [Image.asset('assets/PDAM.png'), Text('PDAM')],
                    ),
                    Column(
                      children: [Image.asset('assets/PGN.png'), Text('PGN')],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/Televisi.png'),
                        Text('Lainnya')
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/Musik.png'),
                          Text('Musik')
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Game.png'),
                          Text('Game')
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Makanan.png'),
                          Text('Makanan')
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Kurban.png'),
                          Text('Kurban')
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Zakat.png'),
                          Text('Zakat')
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Data.png'),
                          Text('Data')
                        ],
                      ),
                    ]),
                const SizedBox(height: 30),
                const Text('Temukan promo menarik', style: TextStyle(fontWeight: FontWeight.bold),),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(
                        child: Image.asset('assets/Banner 1.png'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Image.asset('assets/Banner 2.png'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Image.asset('assets/Banner 3.png'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Image.asset('assets/Banner 4.png'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Image.asset('assets/Banner 5.png'),
                      ),
                    ]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
