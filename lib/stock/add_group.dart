import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:spyco_shop_management/api_models/group_model.dart';
import 'package:spyco_shop_management/constants/size_box.dart';
import 'package:spyco_shop_management/src/utiils/textstyles.dart';
import 'package:spyco_shop_management/widgets/add_person_row_holder.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';
import '../api/stock_apis/group_apis.dart';
import '../api_models/add_group_model.dart';
import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../constants/text_styles.dart';
import '../constants/textfield_decoration.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/main_button.dart';

class AddGroupDialog extends StatefulWidget {
  final String title;
  final String content;
  final void Function(String?) onPop;
  final void Function(int?) onPopId;

  AddGroupDialog({
    required this.title,
    required this.content,
    required this.onPop,
    required this.onPopId});

  @override
  State<AddGroupDialog> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {

  @override
  void initState() {
    getGroup();
    super.initState();
  }
  final usernameController = TextEditingController();

  // int selectedOption = 1;

  // int selectedOption = 1;
  String? selectedOption;
  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  bool isLoading = false;
  final groupNameController = TextEditingController();
  final hsnCodeController = TextEditingController();
  final cgstController = TextEditingController();
  final sgstController = TextEditingController();
  final igstController = TextEditingController();
  final cessController = TextEditingController();
  final workNo = TextEditingController();
  final gstNO = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final pinCodeController = TextEditingController();

  final List<String> invoiceModeList = [
    '3',
    '5',
    '12',
    '18'
  ];
  String? invoiceModeValue;

  String? stateValue;
  String? group_name;


  bool loading = false;

  List<GroupModel> group = [];
  List<GroupModel> groupList = [];
  List<GroupModel> suggestions = [];

  getGroup() {
    isLoading = true;
    var resp = getGroupApi();
    resp.then((value) {
      if (value['status'] == 1) {
        for(var v in value['data']) {
          group.add(GroupModel.fromJson(v));
          suggestions.add(GroupModel.fromJson(v));
        }
        print(group.length);
        setState(() {
          isLoading = false;
        });
      } else {
        isLoading = false;
      }
    });
  }

  AddGroupModel? response;
  int ? id;






  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.70,
            width: MediaQuery.sizeOf(context).width * 0.50,
            child: Column(
              children: [

                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child:SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16,),
                            Text("Add Group",
                              style: styleInterBlack(size: 18, color: Colors.black,),),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Group Name",
                                          style: textfieldTopText),
                                      SizedBox(height: 10,),
                                      TypeAheadField<GroupModel>(
                                        // decorationBuilder: ,
                                        suggestionsCallback: (search) => group.where((group) {
                                          return group.groupName!.toLowerCase().contains(search.toLowerCase());
                                        }).toList(),
                                        builder: (context, controller, focusNode) {
                                          return TextField(
                                            controller: controller,
                                            focusNode: focusNode,
                                            autofocus: true,
                                            decoration: MainFieldDecoration(label: 'Group Name').mainFieldDecoration(),
                                            onChanged: (val) {
                                              setState(() {
                                                groupNameController.text = controller.text;
                                                print(groupNameController.text);

                                              });

                                            },
                                          );
                                        },
                                        itemBuilder: (context, group) {
                                          return ListTile(
                                            title: Text(group.groupName.toString()),
                                          );
                                        },
                                        onSelected: (group) {
                                          setState(() {
                                            groupNameController.text = group.groupName.toString();
                                          });



                                        },
                                      ),
                                      /*  TypeAheadField<GroupModel>(
                                    suggestionsCallback: (search) => group.where((group) {
                                      return group.groupName!.toLowerCase().contains(search.toLowerCase());
                                    }).toList(),
                                    itemBuilder: (context, group) {
                                      return ListTile(
                                        title: Text(group.groupName.toString()),
                                        // Add other fields as needed, e.g., subtitle: Text(group.someOtherField),
                                      );
                                    },
                                    textFieldConfiguration: TextFieldConfiguration(
                                      controller: controller,
                                      focusNode: focusNode,
                                      onChanged: (value) {
                                        setState(() {
                                          groupNameController.text = value;
                                          // Update the suggestions based on the entered value
                                          group = group
                                              .where((g) => g.groupName!.toLowerCase().contains(value.toLowerCase()))
                                              .toList();
                                          print(groupNameController.text);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Group Name',
                                      ),
                                    ), onSelected: (GroupModel value) {  },
                                  )*/

                                      /*Autocomplete<GroupModel>(
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      return suggestions.where((group) {
                                        return group.groupName!.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    onSelected: (GroupModel selectedGroup) {
                                      print("Selected Group: ${selectedGroup.groupName}");

                                      // Set the selected group's name to the controller
                                      groupNameController.text = selectedGroup.groupName!;
                                    },
                                    fieldViewBuilder: (BuildContext context, TextEditingController controller, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                      return TextField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        onChanged: (value) {
                                          setState(() {
                                            groupNameController.text = controller.text;
                                            // Update the suggestions based on the entered value
                                            suggestions = group
                                                .where((g) => g.groupName!.toLowerCase().contains(value.toLowerCase()))
                                                .toList();
                                            print(groupNameController.text);
                                          });
                                        },
                                        decoration: MainFieldDecoration(label: 'Group Name').mainFieldDecoration(),
                                      );
                                    },
                                    optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<GroupModel> onSelected, Iterable<GroupModel> options) {
                                      return Material(
                                        elevation: 4.0,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: options.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            final GroupModel selectedGroup = options.elementAt(index);
                                            return ListTile(
                                              title: Text(selectedGroup.groupName.toString()),
                                              onTap: () {
                                                onSelected(selectedGroup);
                                                // The controller is already updated in onSelected, so no need to update it here
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),*/

                                    ],
                                  ),
                                ),

                                SizedBox(width: 12,),
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Hsn Code',
                                    textField: CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: hsnCodeController,
                                      hintText: 'Hsn Code',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Hsn Code ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizeHeight16(),
                            Text("Gst Rates",
                              style: styleInterBlack(size: 18, color: Colors.black),),
                            sizeHeight16(),
                            Row(
                              children: [
                                Expanded(
                                  child: customDropDownFieldHolder(
                                    title: 'CGST',
                                    child: DropdownButtonFormField(
                                      value: invoiceModeValue,
                                      decoration: MainFieldDecoration(label: '').mainFieldDecoration(),
                                      hint: Text(
                                        'choose one',
                                        style:  const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          invoiceModeValue = value;
                                          cgstController.text = invoiceModeValue!;
                                        });
                                      },
                                      items: invoiceModeList
                                          .map((String val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(
                                            val,
                                          ),
                                        );
                                      }).toList(),
                                    ),),),
                                sizedBoxWidth12(),
                                Expanded(
                                  child: customDropDownFieldHolder(
                                    title: 'SGST',
                                    child: DropdownButtonFormField(
                                      value: invoiceModeValue,
                                      decoration: MainFieldDecoration(label: '').mainFieldDecoration(),
                                      hint: Text(
                                        'choose one',
                                        style:  const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          invoiceModeValue = value;
                                          sgstController.text = invoiceModeValue!;
                                        });
                                      },
                                      items: invoiceModeList
                                          .map((String val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(
                                            val,
                                          ),
                                        );
                                      }).toList(),
                                    ),),),
                              ],
                            ),
                            sizeHeight16(),
                            customDropDownFieldHolder(
                              title: 'IGST',
                              child: DropdownButtonFormField(
                                value: invoiceModeValue,
                                decoration: MainFieldDecoration(label: '').mainFieldDecoration(),
                                hint: Text(
                                  'choose one',
                                  style:  const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    invoiceModeValue = value;
                                    igstController.text = invoiceModeValue!;
                                  });
                                },
                                items: invoiceModeList
                                    .map((String val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(
                                      val,
                                    ),
                                  );
                                }).toList(),
                              ),),

                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (Responsive.isDesktop(context))
                                  isLoading ?
                                  LoadingButton():
                                  MainButton(
                                    radius: 4,
                                    title: 'Add',
                                    press: () {
                                      if(groupNameController.text.isNotEmpty ) {
                                        setState(() {
                                          isLoading = true;
                                          widget.onPop(groupNameController.text);
                                        });
                                        addGroupApi(
                                          groupName: groupNameController.text,
                                          hsnCode: hsnCodeController.text,
                                          cgst: cgstController.text,
                                          sgst: sgstController.text,
                                          igst: igstController.text,
                                          cess: cessController.text,
                                        ).then((value) async {
                                          // response = value;
                                          if (
                                          value['status'] == 1

                                          /*response != null && response?.status == 1*/) {
                                            setState(() {
                                              isLoading = false;

                                              widget.onPopId(id);
                                            });
                                            print("object");
                                            print(id);


                                            // print(object)
                                            /*   print(response);
                                        widget.onPopId(response!.data.id.toString());
                                        print(response!.data.id.toString());*/
                                            // id = response!.data.id.toInt();
                                            Navigator.pop(context);
                                            CustomMsgSnackbar.show(context: context,
                                                label:"Group Added Successfully",
                                                color: Colors.green,
                                                iconImage: icTick);
                                          } else {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            // CustomMsgSnackbar.show(context: context,
                                            //     label: "Failed",
                                            //     color: Colors.red,
                                            //     iconImage: "assets/icons/cross.svg");
                                          }
                                        });
                                      }
                                      // }
                                      // else {
                                      //   CustomMsgSnackbar.show(context: context,
                                      //       label: 'Please Enter Valid Email',
                                      //       color: Colors.red,
                                      //       iconImage: "assets/icons/cross.svg");
                                      // }
                                    },

                                    sizeHorizontal: 30,
                                    sizeVerticle: 8,
                                    color: selectedGreenColor,
                                    titleColor: Colors.white,
                                  ),
                                SizedBox(width: 5,),
                                MainButton(
                                  radius: 4,
                                  title: 'Cancel',
                                  press: () {
                                    // print(response!.data.groupName.toString());
                                    // Navigator.pop(context);
                                    print(id);
                                  },
                                  sizeHorizontal: 18,
                                  sizeVerticle: 8,
                                  color: Colors.grey.withOpacity(0.10),
                                  titleColor: Colors.black,
                                ),
                              ],
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          );
    }
    ),);
  }
}
