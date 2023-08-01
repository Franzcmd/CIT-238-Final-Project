import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'logo_page.dart';
import 'drawer.dart';


class Item {
  final int id;
  final String name;
  final String description;
  final double weight;
  final double height;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.weight,
    required this.height,
  });
}

MaterialColor grassGreen = MaterialColor(0xFF5CBA59, {
  50: Color(0xFFE8F6E8),
  100: Color(0xFFC5E3C5),
  200: Color(0xFFA0D0A1),
  300: Color(0xFF7BCB7B),
  400: Color(0xFF61C561),
  500: Color(0xFF5CBA59),
  600: Color(0xFF57B150),
  700: Color(0xFF4D9A47),
  800: Color(0xFF43833E),
  900: Color(0xFF356B30),
});

class Myapp extends StatelessWidget {
  final List<Item> items = [
    Item(
      id: 1,
      name: 'Chikorita',
      description: 'Chikorita is such an adorable little Pokémon! Its a Grass-type and has this cute leafy headgear. Chikorita is known to be gentle and a bit shy. You know whats cool about it? It can use that leaf on its head to check the health of nearby plants. How thoughtful!',
      weight: 8.0,
      height: 10.0,
    ),
    Item(
      id: 2,
      name: 'Brebloom',
      description: 'Its a Grass/Fighting-type and looks like a martial artist with those stretchy arms and legs. It evolves from Shroomish. When its in action, you better watch out for those powerful punches and kicks. Its one tough fighter!',
      weight: 13.0,
      height: 15.0,
    ),
    Item(
      id: 3,
      name: 'Exeguttor',
      description: ' Exeggutor is quite a sight! Its a Grass/Psychic-type Pokémon with a tall and unique coconut-shaped body. Can you believe it has not one, not two, but three heads? Its psychic abilities make it even more intriguing. It can levitate and move things around using its mind. Talk about brainpower!',
      weight: 15.0,
      height: 30.0,
    ),
    Item(
      id: 4,
      name: 'Victreebel',
      description: 'Its a Grass/Poison-type, and its appearance can be quite intimidating with that large, gaping mouth. But hey, its not just for show. That long vine it has helps it lure and capture prey. Its like a sneaky little hunter!',
      weight: 16.0,
      height: 32.0,
    ),
    Item(
      id: 5,
      name: 'Sceptile',
      description: 'Sceptile is the evolved form of Treecko, and its a real nimble Pokémon! Being a Grass-type, its in tune with nature. But what sets it apart is its leaf blades on its arms. Those leaf blades can deliver some lightning-fast and precise attacks.',
      weight: 10.0,
      height: 17.0,
    ),
    Item(
      id: 6,
      name: 'Roserade',
      description: 'Roserade is a Pokémon with grace and a bit of a dangerous side. Its a Grass/Poison-type and evolves from Roselia. Imagine having a beautiful bouquet of flowers that can unleash potent and toxic pollen in battles. ',
      weight: 15.0,
      height: 14.0,
    ),
    // Add other items here
  ];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: grassGreen,
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogoPage(),
        '/homepage': (context) => HomePage(items: items),
        '/aboutus': (context) => AboutUsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Item> items;

  HomePage({required this.items});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(onSearch);
  }

  void onSearch() {
    String searchQuery = searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items
          .where((item) => item.name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  void onItemFound(Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Types'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Color(0xFFA0D0A1)),
              decoration: InputDecoration(
                hintText: "Search Pokémon",
                hintStyle: TextStyle(color: Color(0xFF7BCB7B)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFFA0D0A1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7BCB7B)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                int itemId = filteredItems[index].id;
                String imagePath = 'assets/images/$itemId.png';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(item: filteredItems[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: grassGreen[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imagePath,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          filteredItems[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}