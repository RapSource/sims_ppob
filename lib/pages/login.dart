import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_adityapratama/pages/register.dart';
import 'package:sims_ppob_adityapratama/provider/login_notifer.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/widget/bottombar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final _auth = FirebaseAuth.instance;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(apiNotifier: ApiNotifier()),
      child: Scaffold(
        body: Consumer<LoginNotifier>(builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Logo.png',
                      height: 30,
                      width: 30,
                    ),
                    const Text('SIMS PPOB',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                  ],
                ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(),
                const Center(
                  child: Text('Masuk atau buat akun untuk memulai',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: 'masukkan email anda',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    hintText: 'masukkan password anda',
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
                      // final navigator = Navigator.of(context);
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      await provider.login(email: email, password: password);
                      if (provider.message.isNotEmpty) {
                        final snackbar =
                            SnackBar(content: Text(provider.message));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                      if (provider.isSuccess) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                      }
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: const Text('Masuk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum mempunyai akun? registrasi'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: const Text('disini',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
