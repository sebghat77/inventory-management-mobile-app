class saleHistory extends StatefulWidget {
  const saleHistory({Key? key}) : super(key: key);

  @override
  State<saleHistory> createState() => _saleHistoryState();
}

class _saleHistoryState extends State<saleHistory> {
  AuthClass authClass = AuthClass();

  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection("Iusers")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Sales")
      .orderBy("dateTime", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> document =
                  snapshot.data.docs[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => UpdateSales(
                        document: document,
                        id: snapshot.data.docs[index].id,
                      ),
                    ),
                  );
                },
                child: TransCard(
                  amount: document["salesPrice"] == null
                      ? 0
                      : document["salesPrice"],
                  check: true,
                  totalAmount: document["salesTotalPrice"] == null
                      ? 0
                      : document["salesTotalPrice"],
                  QTY: document["salesQTY"] == null
                      ? 0
                      : document["salesQTY"],
                  unPaid: document["saleskLoan"] == null
                      ? 0
                      : document["saleskLoan"],
                  itemName: document["salesName"] == null
                      ? "No Data"
                      : document["salesName"],
                  nickName: document["salesNickName"] == null
                      ? "No Data"
                      : document["salesNickName"],
                  label: "Sold",
                  Time: formattedTime(document["dateTime"]),
                  Date: formattedDate(document["dateTime"]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String formattedDate(timeStamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyy').format(dateFromTimeStamp);
  }

  String formattedTime(timeStamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('hh:mm a').format(dateFromTimeStamp);
  }
}

final _streamStockweek = FirebaseFirestore.instance
    .collection("Iusers")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("Transactions")
    .where(
      "dateTime",
      isLessThan: now,
      isGreaterThan: weekly,
    )
    .get();