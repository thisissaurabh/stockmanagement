// Row
// (
// children: [
// Container(
// color: Colors.transparent,
// width: MediaQuery.sizeOf(context).width *0.10,
// child: Text("Supplier Name")),
// SizedBox(width: 16,),
//
// Expanded(
// child: TextFormField(
// controller: supplierNameController,
// maxLines: 1,
// validator:
// (val) {
// if(val == null || val.isEmpty){
// return 'Pick Supplier ';
// }
// return null;
// },
// onTap: () {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: Text('Select Supplier'),
// content: Container(
// width: double.maxFinite,
// child: ListView.builder(
// shrinkWrap: true,
// itemCount: suppliersName.length,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// title: Text(suppliersName[index].firstName.toString()),
// onTap: () {
// setState(() {
// supplierNameController.text = suppliersName[index].firstName.toString();
// // companyName.text = suppliersName[index].firstName.toString();
// setState(() {
// var resp = getSupplierDetailsApi(id: suppliersName[index].id.toString());
// isLoading = true;
// resp.then((value) {
// if (value['status'] == 1) {
// suppliersDetails = SupplierDetailsModel.fromJson(value);
// }
//
// setState(() {
// isLoading = false;
// });
//
// if (value['status'] != 1) {
// print("error");
// }
// });
// });
// });
// Navigator.pop(context); // Close the dialog
// },
// );
// },
// ),
// ),
// );
// },
// );
// },
// decoration: InputDecoration(
// hintText: supplierNameController.text.isEmpty ?
// "Select Supplier":
// supplierNameController.text,
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.yellow,
// width: 0.5,
// ),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(6),
// borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
// ),
// errorBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.red, width: 0.5),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(6),
// borderSide: BorderSide(color: Colors.blue, width: 0.5),
// ),
// ),
// )
// ,
// )
// ,
//
// ]
// ,
// )
// ,