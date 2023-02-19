import 'package:flutter/material.dart';
import 'package:food_ui_design/components.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
    final List<Map<String, String>> popularFood = [
      {
        'name': 'Tandoori Chicken',
        'price': '96.00',
        'rate': '4.9',
        'clients': '200',
        'image': 'assets/chicken.png'
      },
      {
        'name': 'Salmon',
        'price': '40.50',
        'rate': '4.5',
        'clients': '168',
        'image': 'assets/salamon.png'
      },
      {
        'name': 'Rice and meat',
        'price': '130.00',
        'rate': '4.8',
        'clients': '150',
        'image': 'assets/rise.png'
      },
      {
        'name': 'Vegan food',
        'price': '400.00',
        'rate': '4.2',
        'clients': '150',
        'image': 'assets/vegan.png'
      },
      {
        'name': 'Rich food',
        'price': '1000.00',
        'rate': '4.6',
        'clients': '10',
        'image': 'assets/suchi.png'
      }
    ];
    final List<Map<String, String>> foodOptions = [
      {
        'name': 'Meals',
        'image': 'assets/meat_icon.png',
      },
      {
        'name': 'Burger',
        'image': 'assets/burger_icon.png',
      },
      {
        'name': 'Fast Food',
        'image': 'assets/potato_icon.png',
      },
      {
        'name': 'Salads',
        'image': 'assets/salad_icon.png',
      }
    ];
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white10,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'What would you like to eat?',
                          style: TextStyle(fontSize: 21.0),
                        ),
                        Icon(Icons.notifications_none, size: 28.0)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: theme.primaryColor, width: 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 28.0,
                          color: theme.primaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          size: 28.0,
                          color: theme.primaryColor,
                        ),
                        hintText: 'Find a food or Restaurant',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 105,
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 25.0,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        itemCount: foodOptions.length,
                        itemBuilder: (context, index) {
                          Map<String, String> option = foodOptions[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 35.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(
                                      color: Colors.black38,
                                      width: 2.0
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        option['image']!,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  option['name']!,
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Text(
                      'Popular Food',
                      style: TextStyle(fontSize: 21.0),
                    ),
                  ),
                  Container(
                    height: 220.0,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularFood.length,
                      itemBuilder: (context, index) {
                        Map<String, String> product = popularFood[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'details',
                              arguments: {
                                'product': product,
                                'index': index,
                              },
                            );
                          },
                          child: Hero(
                            tag: 'detail_food$index',
                            child: customFoodCard(
                              width: size.width / 2 - 30.0,
                              primaryColor: theme.primaryColor,
                              productName: product['name'],
                              productPrice: product['price'],
                              productUrl: product['image']!,
                              productClients: product['clients'],
                              productRate: product['rate'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 10.0,
                      top: 35.0,
                    ),
                    child: Text(
                      'Best Food',
                      style: TextStyle(fontSize: 21.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Map<String, String> localProduct = {
                        'name': 'The number one!',
                        'price': '26.00',
                        'rate': '5.0',
                        'clients': '150',
                        'image': 'assets/background2.jpg'
                      };
                      Navigator.pushNamed(context, 'details', arguments: {
                        'product': localProduct,
                        'index': popularFood.length
                      });
                    },
                    child: SingleChildScrollView(
                      child: Hero(
                        tag: 'detail_food${popularFood.length}',
                        child: Container(
                          width: size.width - 40,
                          color: Colors.white,
                          padding: const EdgeInsets.only(bottom: 10.0),
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 15.0,
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size.width - 40,
                                    width: size.width - 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage('assets/background2.jpg'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.all(10.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 25.0,
                                        color: theme.primaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 4.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Burger X-Large',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 4.0,
                                              offset: Offset(3.0, 3.0),
                                            )
                                          ]),
                                      child: Icon(
                                        Icons.near_me,
                                        size: 22.0,
                                        color: theme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '5.0 (150)',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      '\$ 26.00',
                                      style: GoogleFonts.barlowCondensed(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
