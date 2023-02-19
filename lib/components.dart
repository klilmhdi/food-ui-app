import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_design/screens/details.dart';
import 'package:google_fonts/google_fonts.dart';

// Header created
Widget customHeader(int quantity, String title, bool internalScreen, context) {
  ThemeData theme = Theme.of(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      internalScreen
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.arrow_back_ios, size: 28.0, color: Colors.deepOrange,),
              ),
            )
          : Container(
              child: const Icon(
                Icons.arrow_back_ios,
                size: 28.0,
                color: Colors.transparent,
              ),
            ),
      Text(
        title,
        style:
            GoogleFonts.cantataOne(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            const Icon(Icons.card_travel, size: 32.0, color: Colors.red),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 18.0,
                width: 18.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 7.0,
                      offset: Offset(-2.0, 2.0),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Card design
Widget customFoodCard({
  required final double width,
  required final Color primaryColor,
  required final String productUrl,
  productName,
  productPrice,
  productRate,
  productClients,
}) =>
    Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
            color: Colors.white12,
        border: Border.all(
          width: 2.0,
          color: Colors.black38
        ),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productUrl),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(3.0, 3.0),
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: 17.0,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productName,
                  style: GoogleFonts.arefRuqaa(fontWeight: FontWeight.bold, fontSize: 14.0)
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
                    size: 17.0,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$productRate \($productClients\)',
                  style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold, fontSize: 12.0)
                ),
                Text(
                  '\$ $productPrice',
                  style: GoogleFonts.barlowCondensed(fontWeight: FontWeight.bold, fontSize: 12.0)
                ),
              ],
            ),
          ),
        ],
      ),
    );

// Add Food widget from Card Tab Screen
Widget renderAddFoods(var foods) {
  return ListView.builder(
    itemCount: foods.length,
    itemBuilder: (BuildContext context, int index) {
      Map<String, String> food = foods[index];
      Color primaryColor = Theme.of(context).primaryColor;
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'details',
              arguments: {
                'product': food,
                'index': index,
              },
            );
          },
          child: Hero(
            tag: 'detail_food $index',
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(food['name']!,
                                  style: GoogleFonts.arefRuqaa(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )
                            ],
                          ),
                          Text(
                            '\$${food['price']}',
                            style: GoogleFonts.numans(fontSize: 18.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.remove),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: primaryColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3.0,
                                  horizontal: 12.0,
                                ),
                                child: const Text(
                                  'Add To 2',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// Tracking Order widget from Card Tab Screen
Widget renderTrackingOrder(var foods) {
  return ListView.builder(
    itemCount: foods.length,
    itemBuilder: (BuildContext context, int index) {
      Map<String, String> food = foods[index];
      Color primaryColor = Theme.of(context).primaryColor;
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'details',
              arguments: {
                'product': food,
                'index': index,
              },
            );
          },
          child: Hero(
            tag: 'detail_food$index',
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              food['name']!,
                              style: GoogleFonts.arefRuqaa(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                          Text(
                            '\$${food['price']}',
                            style: GoogleFonts.numans(fontSize: 18.0),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'View Detail',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// Done Order widget from Card Tab Screen
Widget renderDoneOrder(var foods) {
  return ListView.builder(
    itemCount: foods.length,
    itemBuilder: (BuildContext context, int index) {
      Map<String, String> food = foods[index];
      Color primaryColor = Theme.of(context).primaryColor;
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'details',
              arguments: {
                'product': food,
                'index': index,
              },
            );
          },
          child: Hero(
            tag: 'detail_food $index',
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(food['name']!,
                                style: GoogleFonts.arefRuqaa(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ),
                          Text(
                            '\$${food['price']}',
                            style: GoogleFonts.numans(fontSize: 18.0),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                    const Icon(Icons.star, color: CupertinoColors.systemYellow,),
                                    Text(food['rate']!, style: GoogleFonts.robotoSlab(fontSize: 18.0),)]),
                                  Text(
                                    'Give your review',
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget iconBadge({required IconData icon, required Color iconColor}) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4.0,
          offset: Offset(3.0, 3.0),
        )
      ],
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Icon(
      icon,
      size: 20.0,
      color: iconColor,
    ),
  );
}

// Details in Details tab in Card
Widget detailsTab() => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut enim leo. In sagittis velit nibh. Morbi sollicitudin lorem vitae nisi iaculis,sit amet suscipit orci mollis. Ut dictum lectus eget diam vestibulum, at eleifend felis mattis. Sed molestie congue magna at venenatis. In mollis felis ut consectetur consequat.',
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.blue[900],
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('12am-3pm', style: GoogleFonts.robotoMono(fontSize: 12.0)),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.gps_fixed,
                    color: Colors.green[300],
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('3.54 km', style: GoogleFonts.robotoMono(fontSize: 12.0),),
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.map,
                    color: Colors.red,
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Map view', style: GoogleFonts.robotoMono(fontSize: 12.0)),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.delivery_dining,
                    color: Colors.purple,
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Delivery', style: GoogleFonts.robotoMono(fontSize: 12.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

// Review item in Review tab in Card
Widget renderCardReview() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/man.jpg'),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ahmed Saed',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Feb 11, 2023',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50.0,
            top: 2.0,
          ),
          child: const Text(
            'Cras ac nunc pretium, lacinia lorem ut, congue metus. Aenean vitae lectus at mauris eleifend placerat. Proin a nisl ut risus euismod ultrices et sed dui.',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        )
      ],
    ),
  );


Widget reviewTab() => SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
        ],
      ),
    ),
  );


Widget createDetails(context){
  Size size = MediaQuery.of(context).size;
  dynamic screenArguments = ModalRoute.of(context)!.settings.arguments;
  Map product = screenArguments!['product'];
  int index = screenArguments['index'];
  return Scaffold(
    body: Stack(
      children: [
        Hero(
          tag: 'detail_food$index',
          child: Container(
            alignment: Alignment.topCenter,
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product['image']),
              ),
            ),
          ),
        ),
        BodyDetails(),
      ],
    ),
  );
}