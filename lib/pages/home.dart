import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_adityapratama/provider/home_notifier.dart';
import 'package:sims_ppob_adityapratama/widget/item_banner.dart';
import 'package:sims_ppob_adityapratama/widget/item_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;

  @override
  void initState() {
    Provider.of<HomeNotifier>(context, listen: false).getProfile();
    Provider.of<HomeNotifier>(context, listen: false).getBalance();
    Provider.of<HomeNotifier>(context, listen: false).getServices();
    Provider.of<HomeNotifier>(context, listen: false).getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, provider, child) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Selamat Datang,', style: TextStyle(fontSize: 22)),
                Text(
                    '${provider.profile?.data?.firstName ?? ''} ${provider.profile?.data?.lastName ?? ''}',
                    style:
                        const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
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
                        Text(
                            isVisible
                                ? ' ${provider.balance?.data?.balance ?? ''}'
                                : ' ● ● ● ● ● ● ●',
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
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,
                            )),
                      ])
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _itemServices(provider),
                    const SizedBox(height: 10),
                    const Text(
                      'Temukan promo menarik',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final banner = provider.banner?.data![index];
                            return ItemBanner(banner: banner!);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 0,
                            );
                          },
                          itemCount: provider.banner?.data?.length ?? 0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _itemServices(HomeNotifier provider) {
    if ((provider.services?.data?.isEmpty ?? false) ||
        provider.services?.data == null) {
      return const CircularProgressIndicator();
    }
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (provider.services?.data?.length ?? 0) ~/ 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: (provider.services?.data?.length ?? 0),
      itemBuilder: (context, index) {
        return ItemServices(
          service: provider.services!.data![index],
        );
      },
    );
  }
}
