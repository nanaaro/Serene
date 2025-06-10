import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<Auth> login(String email, String password) async {
    // Kirim data ke API
    final response = await http.get(Uri.parse(
        'https://649443970da866a953677178.mockapi.io/users?email=$email&password=$password'));

    // Cek status response
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);

      // Cek apakah responseData memiliki isi
      if (responseData.isNotEmpty) {
        return Auth.fromJson(responseData[0]);
      } else {
        throw Exception('E-mail atau password salah');
      }

      // return Auth.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal login');
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final String email = emailController.text;
      final String password = passwordController.text;

      login(email, password).then((auth) {
        // Berhasil login, lakukan navigasi langsung ke halaman Home
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((error) {
        // Gagal login, tampilkan pesan error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(error.toString()),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FadeTransition(
                opacity: _animation,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FadeTransition(
                      opacity: _animation,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    MouseRegion(
                      onEnter: (_) => setState(() {}),
                      onExit: (_) => setState(() {}),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ElevatedButton(
                          onPressed: submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    routes: {
      '/register': (context) => RegisterForm(), // Tambahkan rute ke halaman registrasi
      '/screen': (context) => HomeScreen(), // Tambahkan rute ke halaman home
    },
  ));
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Text('Registration Form'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
