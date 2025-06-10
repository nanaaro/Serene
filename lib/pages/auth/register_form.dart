import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:serene/pages/auth/login_form.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DaftarAkun extends StatefulWidget {
  @override
  _DaftarAkunState createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController namabelakangController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController teleponController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    var url = Uri.parse('http://255.255.255.0/design/user/create.php');
    var response = await http.post(url, body: {
      'namadepan': usernameController.text,
      'namabelakang': namabelakangController.text,
      'nohp': teleponController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'kota': kotaController.text,
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        print('Registrasi berhasil');
        // int idUser = jsonResponse['iduser'];

        // // Simpan iduser menggunakan SharedPreferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setInt('idUser', idUser);

        // Tambahkan logika untuk navigasi ke halaman lain jika diperlukan
      } else {
        // Jika gagal registrasi
        print('Registrasi gagal: ${jsonResponse['message']}');
      }
    } else {
      // Jika gagal terhubung dengan API
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Akun Anda'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: namabelakangController,
                  decoration: InputDecoration(
                    labelText: 'namabelakang',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama belakang tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: teleponController,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: kotaController,
                  decoration: InputDecoration(
                    labelText: 'kota',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kota tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Panggil fungsi untuk melakukan registrasi
                      registerUser().then((_) {
                        // Navigasi ke halaman homepage setelah registrasi berhasil
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      });
                    }
                  },
                  child: Text('Daftar'),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sudah punya akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      },
                      child: Text('Masuk'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
