Future<dynamic> getUniqueItemName() async {
  try {
    FirebaseFirestore.instance
        .collection("Iusers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Item')
        .where("itemName", isEqualTo: _addItemNameControler.text)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["itemName"] == _addItemNameControler.text &&
            doc["itemNickName"] == _addItemNickNameControler.text) {
          docID = true;
        } else {
          docID = false;
        }
      });
    });
  } on Exception catch (e) {
    showSnackbar(context, e.toString());
  }
}

Widget buttonSave() {
  Color BgColor;

  return InkWell(
    onTap: () async {
      setState(() {
        circuler = true;
      });

      final isValid = formkey.currentState!.validate();

      if (isValid) {
        try {
          await FirebaseFirestore.instance
              .collection("Iusers")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("Item")
              .add({
            "itemName": _addItemNameControler.text,
            "itemNickName": _addItemNickNameControler.text,
            "itemDescription": _addItemdescriptionControler.text,
            "itemQty": 0,
            "itemCostPer": 0.0,
            "itemTotalCost": 0.0,
          });

          setState(() {
            circuler = false;
          });
        } on Exception catch (e) {
          showSnackbar(context, e.toString());
          setState(() {
            circuler = false;
          });
        }

        formkey.currentState?.save();
        _addItemNameControler.text = "";
        _addItemNickNameControler.text = "";
        _addItemdescriptionControler.text = "";
      }
    },
  );
}

await FirebaseFirestore.instance
    .collection("Iusers")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("Transactions")
    .add({
  "stockName": tempItemName,
  "stockNickName": tempIteNickmName,
  "stockQTY": int.parse(_stocksQuantityController.text),
  "stockCost": double.parse(_stocksPriceCotroller.text),
  "stockTotalCost": double.parse(_stocksTotalPriceCotroller.text),
  "stockLoan": _stocksLoanController.text == ""
      ? 0.0
      : double.parse(_stocksLoanController.text),
  "stockDesc": _stocksDescriptionCotroller.text,
  "dateTime": DateTime.now(),
}).then((value) async {
  await FirebaseFirestore.instance
      .collection("Iusers")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Item')
      .where("itemName", isEqualTo: tempItemName)
      .where("itemNickName", isEqualTo: tempIteNickmName)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      docID = doc.id;
    });
  });

  await FirebaseFirestore.instance
      .collection("Iusers")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Item")
      .doc(docID)
      .update({
    "itemQty": FieldValue.increment(
      int.parse(_stocksQuantityController.text),
    ),
    "itemCostPer": double.parse(_stocksPriceCotroller.text),
    "itemTotalCost": FieldValue.increment(
      double.parse(_stocksTotalPriceCotroller.text),
    ),
    "itemName": tempItemName,
    "itemNickName": tempIteNickmName,
    "itemDescription": tempDes,
  });
});