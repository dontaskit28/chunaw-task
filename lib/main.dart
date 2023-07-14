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
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffFC6B6F), Color(0xffD938BE)],
).createShader(const Rect.fromLTWH(100, 0, 100.0, 0.0));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Chunaw",
            style: TextStyle(
                fontSize: 26,
                // color: Colors.red,
                foreground: Paint()..shader = linearGradient),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(10),
            indicatorColor: const Color(0xffFF565B),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: const Color(0xffFF565B),
            unselectedLabelColor: Colors.grey.shade700,
            tabs: const [
              Text("Home"),
              Text("DBA"),
              Text("VIZ"),
              Text("AP"),
              Text("IND"),
            ],
          ),
        ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xffFF565B),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.tag), label: "Menu"),
          ],
        ),
        body: TabBarView(
          children: [
            home(context),
            const Center(child: Text("DBA")),
            const Center(child: Text("VIZ")),
            const Center(child: Text("AP")),
            const Center(child: Text("IND")),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

Widget home(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.all(15),
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFF565B),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: const Text(
              "Daba Garden, VIZ, AP",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xffFF565B),
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/profile.png'),
                ),
                const SizedBox(width: 5),
                const Text("Charles"),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(40, 255, 86, 91),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: const [
                Text(
                  "DBA",
                  style: TextStyle(
                    color: Color(
                      0xffFF565B,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_drop_down,
                  color: Color(
                    0xffFF565B,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Column(
        children: List.generate(3, (index) => card(context, index)),
      )
    ],
  );
}

Widget card(BuildContext context, int index) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 10, top: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/profile.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Shaikh Ansari",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "13h. Mumbai, India",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                index == 2
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Text(
                          "Upgraded",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                const SizedBox(height: 2),
                const Text("32 mins"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/image.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(height: 10),
        index == 2
            ? Container()
            : Row(
                children: [
                  Transform.rotate(
                    angle: 45,
                    child: const Icon(
                      Icons.push_pin_outlined,
                      color: Color(0xffFC6B6F),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("Good One"),
                ],
              ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.favorite_outline,
                  color: Color(0xffFC6B6F),
                ),
                SizedBox(width: 3),
                Text("32"),
                SizedBox(width: 12),
                Icon(
                  Icons.chat_bubble_outline,
                  color: Color(0xffFC6B6F),
                ),
                SizedBox(width: 3),
                Text("32"),
              ],
            ),
            Row(
              children: [
                const Text("Vote"),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffFC6B6F),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    size: 18,
                    color: Color(0xffFC6B6F),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
