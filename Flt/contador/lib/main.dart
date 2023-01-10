import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  bool get IsEmpaty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/px.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isFull ? 'Lotado' : "Pode Entrar",
                style: TextStyle(
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text('$count',
                  style: TextStyle(
                      color: isFull ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 100)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: IsEmpaty ? null : decrement,
                    style: TextButton.styleFrom(
                      backgroundColor: IsEmpaty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Saiu',
                        style: TextStyle(color: Colors.black))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
