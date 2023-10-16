import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_adityapratama/provider/topup_notifier.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final TextEditingController _nominalController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _nominalController.addListener(_checkInput);
    Provider.of<TopUpNotifier>(context, listen: false).getBalance();
  }

  void _checkInput() {
    final text = _nominalController.text;
    if (text.isEmpty) {
      setState(() {
        isButtonDisabled = true;
      });
    } else {
      final nominal = int.tryParse(text);
      if (nominal != null && nominal >= 10000 && nominal <= 1000000) {
        setState(() {
          isButtonDisabled = false;
        });
      } else {
        setState(() {
          isButtonDisabled = true;
        });
      }
    }
  }

  void _setNominal(int nominal) {
    _nominalController.text = nominal.toString();
    _checkInput();
  }

  GestureDetector pilihanNominalTersedia(int nominal) {
    return GestureDetector(
      onTap: () {
        _setNominal(nominal);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(border: Border.all()),
        child: Center(child: Text('Rp$nominal')),
      ),
    );
  }

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
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25.0,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop()),
              const Text('Kembali',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))
            ],
          ),
          title: Container(
            margin: const EdgeInsets.only(left: 50),
            child: const Text('Top Up',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          )),
      body: Consumer<TopUpNotifier>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
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
                        Text(provider.balance?.data?.balance.toString() ?? '0',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600)),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Silahkan masukan', style: TextStyle(fontSize: 22)),
                const Text('Nominal Top Up',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                TextField(
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
                    hintText: 'masukan nominal Top Up',
                  ),
                ),
                const SizedBox(height: 30),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pilihanNominalTersedia(10000),
                      pilihanNominalTersedia(20000),
                      pilihanNominalTersedia(50000),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pilihanNominalTersedia(100000),
                      pilihanNominalTersedia(250000),
                      pilihanNominalTersedia(500000),
                    ],
                  ),
                ]),
                const SizedBox(height: 50),
                isButtonDisabled
                    ? MaterialButton(
                        color: Colors.grey[300],
                        textTheme: ButtonTextTheme.primary,
                        height: 50,
                        onPressed: () {},
                        child: const Text(
                          'Top Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : MaterialButton(
                        color: Colors.red,
                        textTheme: ButtonTextTheme.primary,
                        height: 50,
                        onPressed: () async {
                          await provider.topUp(
                              amount: int.parse(_nominalController.text));
                          if (provider.message.isNotEmpty) {
                            final snackbar =
                                SnackBar(content: Text(provider.message));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          }
                        },
                        child: const Text('Top Up'),
                      )
              ],
            ),
          ),
        );
      }),
    );
  }
}
