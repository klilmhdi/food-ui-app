import 'package:flutter/material.dart';
import 'package:food_ui_design/components.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool switchValue = true;
  final List<Map<String, String>> favoriteFoods = [
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
    }
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Profile',
              style: GoogleFonts.cantataOne(
                  fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
                margin: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 15.0,
                ),
                child: const Image(
                  image: AssetImage('assets/khlil.png'),
                  height: 200.0,
                  width: 200.0,
                )),
            Text(
              'Khaleel Mahdi',
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                fontSize: 22.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.location_on,
                      size: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Gaza, Palestine',
                    style: GoogleFonts.roboto(
                      fontSize: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '250K',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: theme.primaryColor,
                        ),
                      ),
                      Text(
                        'Follower',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '500',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: theme.primaryColor,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '540',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: theme.primaryColor,
                        ),
                      ),
                      Text(
                        'Taste Master',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: theme.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: theme.primaryColor,
                labelStyle: const TextStyle(fontSize: 20.0),
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Your Favorities'),
                  Tab(text: 'Account Setting'),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: ((size.width / 2) / 230),
                    children: favoriteFoods.map((product) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: customFoodCard(
                          width: size.width,
                          primaryColor: theme.primaryColor,
                          productName: product['name'],
                          productPrice: product['price'],
                          productUrl: product['image']!,
                          productClients: product['clients'],
                          productRate: product['rate'],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.person, color: Colors.black87),
                          title: const Text(
                            'About You',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.email, color: Colors.black87),
                          title: const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: const Text(
                            'khlilmhdi02@gmail.com',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone_android,
                              color: Colors.black87),
                          title: const Text(
                            'Phone Number',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: const Text(
                            '+972 598 137 134',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.credit_card,
                              color: Colors.black87),
                          title: const Text(
                            'Payment',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: const Text(
                            '123-456-798-123',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.remove_red_eye_rounded,
                              color: Colors.black87),
                          title: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.rule_folder_sharp,
                              color: Colors.black87),
                          title: const Text(
                            'Terms of Use',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.exit_to_app, color: Colors.red),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
