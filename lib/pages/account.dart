import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/pages/edit_profile.dart';

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
                child: Container(
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
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: IconButton(
                              onPressed: () {},
                              iconSize: 20,
                              icon: Icon(Icons.edit))),
                    )
                  ]),
                ),
              ),
              Center(
                child: Text('Aditya Pratama',
                    // '${provider.profile?.data?.firstName ?? ''} ${provider.profile?.data?.lastName ?? ''}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 30),
              const Text('Email'),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextField(
                  enabled: false,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: 'adityapratama7292@gmail.com',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Nama Depan'),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextField(
                  enabled: false,
                  controller: _namaDepanController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_rounded),
                    hintText: 'aditya',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Nama Belakang'),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextField(
                  enabled: false,
                  controller: _namaBelakangController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_rounded),
                    hintText: 'pratama',
                  ),
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
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.red),
                  ),
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
  }
}
