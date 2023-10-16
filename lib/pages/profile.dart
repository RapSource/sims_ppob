import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_adityapratama/pages/update_profile.dart';
import 'package:sims_ppob_adityapratama/provider/home_notifier.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();

  @override
  void initState() {
    Provider.of<HomeNotifier>(context, listen: false).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, provider, child) {
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
              margin: const EdgeInsets.only(left: 55),
              child: const Text('Akun',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: Stack(children: [
                      ClipRRect(
                        child: Image.asset('assets/Profile Photo-1.png'),
                      ),
                      Positioned(
                        top: 82,
                        left: 85,
                        child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 20,
                                icon: Icon(Icons.edit))),
                      )
                    ]),
                  ),
                ),
                Center(
                  child: Text(
                      '${provider.profile?.data?.firstName ?? 'data gada'} ${provider.profile?.data?.lastName ?? 'data gada'}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                const Text('Email'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    children: [
                      const Icon(Icons.alternate_email),
                      const SizedBox(width: 5),
                      Text('${provider.profile?.data?.email ?? ''}')
                    ]
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Nama Depan'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    children: [
                      const Icon(Icons.person_rounded),
                      const SizedBox(width: 5),
                      Text('${provider.profile?.data?.firstName ?? 'data gada'}')
                    ]
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Nama Belakang'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    children: [
                      const Icon(Icons.person_rounded),
                      const SizedBox(width: 5),
                      Text('${provider.profile?.data?.lastName ?? 'data gada'}')
                    ]
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
