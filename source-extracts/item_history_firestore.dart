class ItemHistory extends StatefulWidget {
  const ItemHistory({Key? key}) : super(key: key);

  @override
  State<ItemHistory> createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> {
  String Name = "";
  bool search = false;
  TextEditingController _searchController = TextEditingController();
  AuthClass authClass = AuthClass();

  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection("Iusers")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Item")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: const Color(0xff252041),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            search ? itemName() : Row(children: const [Text("Items")]),
          ],
        ),
      ),
      // Additional list and search UI continues in the report.
    );
  }
}