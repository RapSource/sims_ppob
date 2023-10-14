import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();
  // final _auth = FirebaseAuth.instance;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Logo.png', height: 30, width: 30,),
                const Text('SIMS PPOB',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
              ],
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            const Center(
              child: Text('Lengkapi data untuk membuat akun',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'masukan email anda',
              ),
            ),
            TextField(
              controller: _namaDepanController,
              obscureText: _obscureText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_rounded),
                hintText: 'nama depan',
              ),
            ),
            TextField(
              controller: _namaBelakangController,
              obscureText: _obscureText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_rounded),
                hintText: 'nama belakang',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                hintText: 'buat password',
              ),
            ),
            TextField(
              controller: _rePasswordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                hintText: 'konfirmasi password',
              ),
            ),
            MaterialButton(
              color: Colors.red,
              textTheme: ButtonTextTheme.primary,
              height: 50,
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final navigator = Navigator.of(context);
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  // await _auth.signInWithEmailAndPassword(
                  //   email: email,
                  //   password: password
                  // );
                } catch (e) {
                  final snackbar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: const Text('Registrasi'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sudah punyai akun? login'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('disini', style: TextStyle(color: Colors.red)),
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
    _emailController.dispose();
    _namaDepanController.dispose();
    _namaBelakangController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
