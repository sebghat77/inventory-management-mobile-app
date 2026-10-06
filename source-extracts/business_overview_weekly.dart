final _streamStockweek = FirebaseFirestore.instance
    .collection("Iusers")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("Transactions")
    .where("dateTime", isLessThan: now, isGreaterThan: weekly)
    .get();

FutureBuilder(
  future: _streamSaleweek,
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
    sum = 0;
    if (querySnapshot.hasError) return Text("NaN");
    if (querySnapshot.hasData && !querySnapshot.data!.docs.isNotEmpty) return Text("NaN");
    if (querySnapshot.connectionState == ConnectionState.done) {
      querySnapshot.data!.docs.forEach((doc) {
        sum = sum + doc["salesTotalPrice"];
      });
      return Text("${sum}");
    }
    return Text("loading");
  },
);

// The same weekly query pattern is used for profit, expenses, stock cost,
// outstanding stock/loan amounts and customer receivables.
