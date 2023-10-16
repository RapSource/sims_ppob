import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_adityapratama/provider/update_profile_notifier.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();



  @override
  void initState() {
    Provider.of<UpdateNotifier>(context, listen: false).getProfile();
    super.initState();
  }

  Future<void> _updateProfile() async {
    UpdateNotifier provider = context.read<UpdateNotifier>();
    try {
      await provider.update(
        email: _emailController.text,
        firstName: _namaDepanController.text,
        lastName: _namaBelakangController.text);
        
      if (provider.message.isNotEmpty) {
        final snackbar = SnackBar(content: Text(provider.message));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }

      if (provider.isSuccess) {
        final snackbar = SnackBar(content: Text('Profile berhasil diubah'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateNotifier>(builder: (context, provider, child) {
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
                                icon: const Icon(Icons.edit))),
                      )
                    ]),
                  ),
                ),
                Center(
                  child: Text(
                      '${provider.profile?.data?.firstName ?? ''} ${provider.profile?.data?.lastName ?? ''}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                const Text('Email'),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: TextField(
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
                  child: ElevatedButton(
                    onPressed: () {
                      _updateProfile();
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ElevatedButton(
                    onPressed: () {
                      _emailController.clear();
                      _namaDepanController.clear();
                      _namaBelakangController.clear();
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    child: const Text(
                      'Batalkan',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _namaDepanController.dispose();
    _namaBelakangController.dispose();
    super.dispose();
  }
}
