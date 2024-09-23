import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Username atau password salah!'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.pinkAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/kalkulator.png',
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 40),
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
            title: const Text(
                'Tugas 1 Pemrograman Aplikasi Mobile \n Dewi \n Lenansya'),
            centerTitle: true),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            MenuButton(
              label: 'Penjumlahan & Pengurangan',
              icon: Icons.calculate,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MathPage()),
                );
              },
            ),
            MenuButton(
              label: 'Cek Ganjil/Genap',
              icon: Icons.format_list_numbered,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EvenOddPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const MenuButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.teal),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  final _number1Controller = TextEditingController();
  final _number2Controller = TextEditingController();
  String _result = '';

  void _addNumbers() {
    int num1 = int.parse(_number1Controller.text);
    int num2 = int.parse(_number2Controller.text);
    setState(() {
      _result = 'Hasil Penjumlahan: ${num1 + num2}';
    });
  }

  void _subtractNumbers() {
    int num1 = int.parse(_number1Controller.text);
    int num2 = int.parse(_number2Controller.text);
    setState(() {
      _result = 'Hasil Pengurangan: ${num1 - num2}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjumlahan & Pengurangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Angka Pertama'),
                ),
                TextField(
                  controller: _number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Angka Kedua'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _addNumbers,
                      child: const Text('Tambah'),
                    ),
                    ElevatedButton(
                      onPressed: _subtractNumbers,
                      child: const Text('Kurang'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(_result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EvenOddPage extends StatefulWidget {
  const EvenOddPage({super.key});

  @override
  _EvenOddPageState createState() => _EvenOddPageState();
}

class _EvenOddPageState extends State<EvenOddPage> {
  final _numberController = TextEditingController();
  String _result = '';

  void _checkEvenOdd() {
    int number = int.parse(_numberController.text);
    setState(() {
      if (number % 2 == 0) {
        _result = 'Bilangan $number adalah Genap';
      } else {
        _result = 'Bilangan $number adalah Ganjil';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Ganjil/Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Masukkan Angka'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkEvenOdd,
                  child: const Text('Cek'),
                ),
                const SizedBox(height: 20),
                Text(_result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
