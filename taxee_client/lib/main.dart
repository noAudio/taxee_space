import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taxee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: const [
            NavArea(),
            // Center(child: Stack()),
          ],
        ),
      ),
    );
  }
}

class NavArea extends StatefulWidget {
  const NavArea({
    Key? key,
  }) : super(key: key);

  @override
  State<NavArea> createState() => _NavAreaState();
}

class _NavAreaState extends State<NavArea> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 450,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Expand search inputs button
                      Visibility(
                        visible: !isExpanded,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                return setState(() => isExpanded = !isExpanded);
                              },
                              icon: const Icon(Icons.expand_more),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                return setState(() => isExpanded = !isExpanded);
                              },
                              icon: const Icon(Icons.expand_less),
                            ),
                          ),
                        ),
                      ),
                      // Searchbars
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SearchBar(
                              isExpanded: !isExpanded,
                              hintText: 'Search System',
                            ),
                            SearchBar(
                              isExpanded: isExpanded,
                              hintText: 'Origin',
                            ),
                            SearchBar(
                              isExpanded: isExpanded,
                              hintText: 'Destination',
                            ),
                          ],
                        ),
                      ),
                      // Swicth inputs button
                      Visibility(
                        visible: isExpanded,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.import_export_outlined),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 450,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SystemResult(
                      distance: '144ly',
                      systemName: 'Mainani',
                    ),
                    SystemResult(
                      distance: '200ly',
                      systemName: 'Manah',
                    ),
                    SystemResult(
                      distance: '230ly',
                      systemName: 'Manabush',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.ac_unit),
            color: Colors.yellow,
            mouseCursor: SystemMouseCursors.click,
          ),
        ],
      ),
    );
  }
}

class SystemResult extends StatelessWidget {
  const SystemResult({
    Key? key,
    required this.distance,
    required this.systemName,
  }) : super(key: key);

  final String distance;
  final String systemName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
      ),
      child: Row(
        children: [
          Text(
            distance,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            systemName,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.isExpanded,
    required this.hintText,
  }) : super(key: key);

  final bool isExpanded;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isExpanded,
      child: TextField(
        autofocus: true,
        style: const TextStyle(
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
