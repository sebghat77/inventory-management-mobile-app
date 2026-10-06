class NavigationDrawer extends StatelessWidget {
  AuthClass authClass = AuthClass();
  final Padding = EdgeInsets.symmetric(horizontal: 20);

  final userEmail = FirebaseAuth.instance.currentUser!.email();
  String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
  final image = "assets/avatar.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff252041),
        child: ListView(
          children: <Widget>[
            buildHeader(
              image: image,
              name: "Ananymus User",
              email: userEmail == null ? phone : userEmail,
            ),
            Container(
              padding: Padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(text: "Home/Items", icon: CupertinoIcons.home, onCliccked: () => selectedItem(context, 5)),
                  buildMenuItem(text: "Add/Entry Data", icon: Icons.add_card_outlined, onCliccked: () => selectedItem(context, 0)),
                  buildMenuItem(text: "Sales History", icon: MyFlutterApp.logo, onCliccked: () => selectedItem(context, 1)),
                  buildMenuItem(text: "Stocks History", icon: Icons.shopping_cart, onCliccked: () => selectedItem(context, 2)),
                  buildMenuItem(text: "Expenses", icon: Icons.wallet_membership, onCliccked: () => selectedItem(context, 3)),
                  buildMenuItem(text: "Money Transactions", icon: Icons.money, onCliccked: () => selectedItem(context, 4)),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(text: "Settings", icon: Icons.settings),
                  buildMenuItem(text: "LogOut", icon: Icons.logout, onCliccked: () => selectedItem(context, 6)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onCliccked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onCliccked,
    );
  }

  void selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddItemStocksSales()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transation()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transation2()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensesswipView()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => overView()));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage2()));
        break;
      case 6:
        await authClass.logout();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => SignUpPsge()),
          (route) => false,
        );
        break;
    }
  }
}