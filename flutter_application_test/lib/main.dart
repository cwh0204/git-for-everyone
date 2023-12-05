import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeigth = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth * 0.74,
              height: screenHeigth * 0.1,
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.50,
                          height: screenHeigth * 0.05,
                          child: TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "아이디 or @이하 모두 입력",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.50,
                          height: screenHeigth * 0.05,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "비밀번호",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                            ),
                            // 밑줄 제거
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (buttonColor == Colors.white) {
                          buttonColor = Colors.black38;
                        } else if (buttonColor == Colors.black38) {
                          buttonColor = Colors.green;
                        } else if (buttonColor == Colors.green) {
                          buttonColor = Colors.red;
                        } else if (buttonColor == Colors.red) {
                          buttonColor = Colors.white;
                        }
                        // Toggle light when tapped.
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.24,
                      height: screenHeigth * 0.1,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "로그인",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
