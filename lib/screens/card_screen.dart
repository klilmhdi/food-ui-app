import 'package:flutter/material.dart';
import 'package:food_ui_design/components.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Map<String, String>> foods = [
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
  ];

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            customHeader(foods.length, 'Cart Food', false, context),
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: theme.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black87,
                tabs: const [
                  Tab(text: 'Add Food'),
                  Tab(text: 'Tracking Order'),
                  Tab(text: 'Done Order'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: renderAddFoods(foods),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 35.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: theme.primaryColor,
                          ),
                          child: const Text(
                            'CHECKOUT',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.20 * foods.length,
                          width: size.width,
                          child: renderTrackingOrder(foods),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 65.0),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 35.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: theme.primaryColor,
                          ),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.location_searching,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'View Tracking Order',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    renderDoneOrder(foods),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
