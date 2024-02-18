import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyco_shop_management/api/login_register/register_apis.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/screens/register/register_password.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';


class RegisterDetailsScreen extends StatefulWidget {
  const RegisterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RegisterDetailsScreen> createState() => _RegisterDetailsScreenState();
}

class _RegisterDetailsScreenState extends State<RegisterDetailsScreen> {
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final usernameController = TextEditingController();
  final gstNoController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final imageController = TextEditingController();
  final pincode = TextEditingController();
  bool showEye = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  File pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();

  final List<String> stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and\n Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar\n Haveli and Daman and Diu',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
  ];

  String? stateValue;
  late List<String> filteredStates;

  @override
  void initState() {
    super.initState();
    filteredStates = stateList; // Initialize filteredStates here
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: selectedGreenColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
              child: Container(
                height: height,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Our Logo',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: selectedGreenColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Enter',
                                          style: ralewayStyle.copyWith(
                                            fontSize: 25.0,
                                            color:Colors.white,
                                            fontWeight: FontWeight.normal,
                                          )),
                                      TextSpan(
                                        text: ' Company Details',
                                        style: ralewayStyle.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                Text(
                                  'Hey, Enter your details to create \nyour account.',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        XFile? v = await _imgPicker.pickImage(
                                            maxWidth: 90,
                                            maxHeight: 90,
                                            source: ImageSource.gallery);
                                        if (v != null) {
                                          setState(
                                                () {
                                              pickedImage = File(v.path);
                                              imageController.text = pickedImage.toString();

                                            },
                                          );
                                        }

                                      },
                                      child: MouseHover(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(16)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Ionicons.push_outline,
                                              size: 24,
                                              color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      height:MediaQuery.sizeOf(context).height * 0.15,
                                      width: MediaQuery.sizeOf(context).width * 0.08,
                                      clipBehavior: Clip.hardEdge,
                                      decoration :BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child:
                                      pickedImage.path.isEmpty
                                          ? SvgPicture.asset("assets/icons/placeholderperson.svg",
                                        height:MediaQuery.sizeOf(context).height * 0.15,
                                      )
                                          :
                                      Image.file(
                                        height:MediaQuery.sizeOf(context).height * 0.15,
                                        pickedImage,
                                        fit: BoxFit.cover,
                                      ), // backgroundImage: AssetImage('assets/images/Frame1000002321.png'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          ),
                        ],
                      ),
                        SizedBox(height: height * 0.010),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Name',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Container(
                                    height: 50.0,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: Colors.transparent
                                      // color: AppColors.whiteColor,
                                    ),
                                    child: TextFormField(
                                      controller: nameController,
                                      cursorColor: Colors.black,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(20),
                                      ],
                                      decoration: DecorationCustom(
                                        suffixIcon: false,
                                        label: 'Your Name',
                                        prefixIcon: 'sms',
                                      ).textFieldDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Company Name',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Container(
                                    height: 50.0,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: Colors.transparent
                                      // color: AppColors.whiteColor,
                                    ),
                                    child: TextFormField(
                                      controller: companyController,
                                      cursorColor: Colors.black,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                      ],
                                      decoration: DecorationCustom(
                                        suffixIcon: false,
                                        label: 'Your Company Name',
                                        prefixIcon: 'sms',
                                      ).textFieldDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'UserName',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                              color: Colors.transparent,
                            // color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            controller: usernameController,
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            decoration: DecorationCustom(
                              suffixIcon: false,
                              label: 'Your UserName',
                              prefixIcon: 'sms',
                            ).textFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Gst No',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                              color: Colors.transparent
                            // color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            controller: gstNoController,
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                            ],
                            decoration: DecorationCustom(
                              suffixIcon: false,
                              label: 'Your Gst No',
                              prefixIcon: 'sms',
                            ).textFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Address',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                              color: Colors.transparent,
                            // color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            // keyboardType: TextInputType.emailAddress,
                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },
                            controller: addressController,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            decoration: DecorationCustom(
                              suffixIcon: false,
                              label: 'Business Address',
                              prefixIcon: 'sms',
                            ).textFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: height * 0.014),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'State',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),

                                  Container(
                                    height: 50.0,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.transparent,
                                      // color: AppColors.whiteColor,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Autocomplete<String>(
                                        optionsBuilder: (TextEditingValue textEditingValue) {
                                          return stateList.where((String option) {
                                            return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                          });
                                        },
                                        onSelected: (String selectedValue) {
                                          print("Selected state: $selectedValue");
                                        },
                                        fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                          return TextField(
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            decoration: DecorationCustom(
                                              suffixIcon: false,
                                              label: 'State',
                                              prefixIcon: 'sms',
                                            ).textFieldDecoration(),
                                          );
                                        },
                                        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                                          return Material(
                                            child: Container(
                                              height: 200.0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 30.0),
                                                child: ListView(
                                                  children: options.map((String option) => SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    child: ListTile(
                                                      title: Text(option),
                                                      onTap: () {
                                                        onSelected(option);
                                                      },
                                                    ),
                                                  )).toList(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )




                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'City',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Container(
                                    height: 50.0,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.transparent,
                                      // color: AppColors.whiteColor,
                                    ),
                                    child: TextFormField(
                                      controller: cityController,
                                      cursorColor: Colors.black,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(20),
                                      ],
                                      decoration: DecorationCustom(
                                        suffixIcon: false,
                                        label: 'City',
                                        prefixIcon: 'sms',
                                      ).textFieldDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Pincode',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.transparent,
                            // color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],

                            // keyboardType: TextInputType.emailAddress,
                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },
                            controller: pincode,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            decoration: DecorationCustom(
                              suffixIcon: false,
                              label: 'Pincode',
                              prefixIcon: 'sms',
                            ).textFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: height * 0.014),

                        SizedBox(height: height * 0.03),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if(
                              nameController.text.isNotEmpty &&
                              companyController.text.isNotEmpty &&
                              usernameController.text.isNotEmpty &&
                              gstNoController.text.isNotEmpty &&
                                  pincode.text.isNotEmpty &&
                                  cityController.text.isNotEmpty &&
                                  stateController.text.isNotEmpty &&
                              addressController.text.isNotEmpty&&
                                  imageController.text.isNotEmpty
                              ) {
                                setState(() {
                                  isLoading = true;
                                });
                                companyRegister(
                                    name: nameController.text,
                                    companyName: companyController.text,
                                    userName: usernameController.text,
                                    gstNo: gstNoController.text,
                                    address: addressController.text,
                                    zipCode: pincode.text,
                                    city: cityController.text,
                                    state: stateController.text,
                                    photo: pickedImage.isAbsolute
                                        ? pickedImage.path
                                        : ''
                                ).then((value) async {
                                  if (value['status'] == 1) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    CustomSnackbar.show(context: context,
                                        label: 'Success',
                                        color: Colors.green,
                                        iconImage: "assets/icons/tick.svg");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPasswordScreen()),
                                    );

                                  } else {
                                    isLoading = false;
                                    CustomSnackbar.show(context: context,
                                        label: 'Failed!!',
                                        color: Colors.red,
                                        iconImage: "assets/icons/cross.svg");
                                  }
                                });
                              } else {
                                CustomMsgSnackbar.show(context: context,
                                    label: 'Please Enter Company Details',
                                    color: Colors.red,
                                    iconImage: "assets/icons/cross.svg");
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => RegisterPasswordScreen()),
                              // );
                            },
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MultiProvider(
                            //       providers: [
                            //         ChangeNotifierProvider(
                            //           create: (context) => MenuAppController(),
                            //         ),
                            //       ],
                            //       child: MainScreen(),
                            //     ),
                            //   ),
                            // ),
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 18.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.black,
                              ),
                              child: Text(
                                'Continue',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 50,
                        //   width: width,
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(left: 16.0),
                        //           child: Text(
                        //             'Dont have an account ?',
                        //             style: ralewayStyle.copyWith(
                        //               fontSize: 12.0,
                        //               color: AppColors.blueDarkColor,
                        //               fontWeight: FontWeight.w700,
                        //             ),
                        //           ),
                        //         ),
                        //         TextButton(
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => RegisterScreen()),
                        //             );
                        //           },
                        //           child: Text(
                        //             'Register now',
                        //             style: ralewayStyle.copyWith(
                        //               fontSize: 12.0,
                        //               color: bgColor,
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //           ),
                        //         ),
                        //       ]),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
