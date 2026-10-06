class _AddItemStocksSalesState extends State<AddItemStocksSales> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xff252041),
          title: Text("Adding Data"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Items', icon: Icon(CupertinoIcons.add)),
              Tab(text: 'Sales', icon: Icon(MyFlutterApp.logo)),
              Tab(text: 'Stocks', icon: Icon(Icons.shopping_cart)),
              Tab(text: 'Expense', icon: Icon(Icons.add_card)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddItem(),
            AddSales(),
            AddStocks(),
            AddExpenses(),
          ],
        ),
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int cIndex = 0;

  final screens = [
    ItemHistory(),
    AddItemStocksSales(),
    Transation(),
    Transation2(),
    ExpensesswipView(),
    overView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: screens[cIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff252041),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 30,
        currentIndex: cIndex,
        onTap: (index) => setState(() => cIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Color(0xff252041)),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: "Add", backgroundColor: Color(0xff252041)),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.logo), label: "Sales", backgroundColor: Color(0xff252041)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Stocks", backgroundColor: Color(0xff252041)),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_membership), label: "Expenses", backgroundColor: Color(0xff252041)),
          BottomNavigationBarItem(icon: Icon(Icons.summarize), label: "OverView", backgroundColor: Color(0xff252041)),
        ],
      ),
    );
  }
}