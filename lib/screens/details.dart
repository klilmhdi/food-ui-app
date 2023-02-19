import 'package:flutter/material.dart';
import 'package:food_ui_design/components.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyDetails extends StatefulWidget {
  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> with TickerProviderStateMixin {
  int quantity = 0;
  int screenTab = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenArguments = ModalRoute.of(context)!.settings.arguments;
    Map product = screenArguments!['product'];
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customHeader(quantity, '',  true, context),
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.55,
              left: 50.0,
              right: 50.0,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 65.0, bottom: 10.0),
            child: iconBadge(
              icon: Icons.favorite,
              iconColor: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              width: size.width - 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        iconBadge(
                          icon: Icons.near_me,
                          iconColor: theme.primaryColor,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['name'],
                            style: GoogleFonts.robotoSerif(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$ ${product['price']}',
                            style: GoogleFonts.numans(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // By Restaurant
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'by',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        const Text('Restaurant'),
                      ],
                    ),
                  ),
                  // Add to basket, plus || minius buttons
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 30.0,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text(
                            'Add To Basket',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30.0,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tabs header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBar(
                      physics: const BouncingScrollPhysics(),
                      controller: _tabController,
                      labelColor: theme.primaryColor,
                      labelPadding: const EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                      tabs: [
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'DETAILS',
                          ),
                        ),
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Review',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tabs body in details
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: _tabController,
                      children: [
                        detailsTab(),
                        reviewTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

