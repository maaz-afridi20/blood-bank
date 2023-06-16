import 'package:smart_blood_bank/consts/exports.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => MainHomePageState();
}

class MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Smart Blood Bank'),
      ),
      endDrawer: SafeArea(
        child: Drawer(
          backgroundColor: drawerBackground,
          child: Column(
            children: [
              ListTile(
                tileColor: lightRedcolor,
                title: Text(
                  'Filter by',
                  textAlign: TextAlign.center,
                  style: customTextStyle(
                    weight: FontWeight.bold,
                    size: 14,
                    color: whitecolor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const DrawerListilee(),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    10,
                    (index) {
                      return const Column(
                        children: [
                          DetailsCardWidget(),
                          SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
