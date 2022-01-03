import 'dart:io';

import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:allerg/models/users.dart';
import 'package:allerg/services/convert_time.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PersonalData extends StatefulWidget {
  final Users? users;

  const PersonalData(this.users, {Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AuthViewModel _authViewModel;

  String initialCountry = 'NG';
  var fNamecontroller = TextEditingController();
  var lNamecontroller = TextEditingController();
  var phoneController = TextEditingController();
  var sosPhoneController = TextEditingController();
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var dobController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();
  String profilePictureUrl = "";

  PickedFile? selectedImage;

  @override
  void initState() {
    super.initState();

    editableText();
    editableTextListeners();
  }

  editableText() {
    fNamecontroller.text = widget.users!.firstName ?? "";
    lNamecontroller.text = widget.users!.lastName ?? "";
    addressController.text = widget.users!.location ?? "";
    phoneController.text = widget.users!.phoneNumber ?? "";
    sosPhoneController.text = widget.users!.sosPhoneNumber ?? "";
    nameController.text = widget.users!.sosContact ?? "";
    genderController.text = widget.users!.gender ?? "";
    dobController.text = widget.users!.dob ?? "";
    ageController.text = widget.users!.age ?? "";
    profilePictureUrl = widget.users!.picture ?? "";
  }

  editableTextListeners() {
    /*fNamecontroller.addListener(() {
      fNamecontroller.text = fNamecontroller.text;
    });

    lNamecontroller.addListener(() {
      lNamecontroller.text = lNamecontroller.text;
    });

    addressController.addListener(() {
      addressController.text = addressController.text;
    });*/
  }

  pickImageFromGallery() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    selectedImage = image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = AuthViewModel();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Positioned(
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        const Center(
                            child: Text(
                              "Personal Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        InkWell(
                          onTap: ()async{
                            var res = await _authViewModel.uploadProfilePicture(selectedImage!.path, );

                            profilePictureUrl = res;
                            setState(() {
                            });
                          },
                          child: const Text(
                            "Upload",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pickImageFromGallery();
                },
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
                  height: size.height * .11,
                  width: size.width * .25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: (widget.users!.picture!.isNotEmpty)
                          ? DecorationImage(
                          image: NetworkImage(widget.users!.picture!))
                          : (selectedImage == null)
                          ? const DecorationImage(
                          image: AssetImage(
                            'assets/images/boardone.png',
                          ),
                          fit: BoxFit.cover)
                          : DecorationImage(
                          image: FileImage(File(selectedImage!.path)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Your First Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ]))),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "First Name",
                          obscurity: false,
                          controller: fNamecontroller,
                          icon: const Icon(Icons.portrait),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Your Last Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "Last Name",
                          controller: lNamecontroller,
                          obscurity: false,
                          icon: Icon(Icons.portrait),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Phone Number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ]))),
                      IntlPhoneField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {
                          // phoneController.text = phone.toString();
                        },
                        onCountryChanged: (phone) {
                          // print('Country code changed to: ' + phone.countryCode);
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Emergency Phone Number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
                      IntlPhoneField(
                        controller: sosPhoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {
                          // sosPhoneController.text = phone.toString();
                        },
                        onCountryChanged: (phone) {
                          // print('Country code changed to: ' + phone.countryCode);
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Contact Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "Contact Name",
                          controller: nameController,
                          obscurity: false,
                          icon: Icon(Icons.portrait),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Gender',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "Gender",
                          controller: genderController,
                          obscurity: false,
                          icon: Icon(Icons.portrait),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Date of Birth',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () async {
                            var res = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2024));

                            dobController.text =
                                ConvertTime().getReadableDate(res);

                            ageController.text =
                                ConvertTime().calculateAge(res);
                            setState(() {});
                          },
                          child: AbsorbPointer(
                            child: CustomEditText(
                              hintText: "Date of Birth",
                              obscurity: false,
                              controller: dobController,
                              icon: Icon(Icons.portrait),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Age',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "Age",
                          obscurity: false,
                          controller: ageController,
                          icon: Icon(Icons.portrait),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomEditText(
                          hintText: "Address",
                          controller: addressController,
                          obscurity: false,
                          icon: Icon(Icons.portrait),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Users userInfo = Users(
                              firstName: fNamecontroller.text,
                              lastName: lNamecontroller.text,
                              username: widget.users!.username,
                              password: widget.users!.picture,
                              emailAddress: widget.users!.emailAddress,
                              phoneNumber: phoneController.text,
                              sosPhoneNumber: sosPhoneController.text,
                              sosContact: nameController.text,
                              gender: genderController.text,
                              dob: dobController.text,
                              age: ageController.text,
                              allergyType: "",
                              picture: profilePictureUrl,
                              hasEpipen: "false",
                              ipAddress: widget.users!.ipAddress,
                              location: widget.users!.location,
                              createdOn: widget.users!.createdOn,
                              updatedOn: "${DateTime.now()}");

                          var response =
                          await _authViewModel.updateUserInfo(userInfo);

                          if (response) {
                            setState(() {});
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: AppColors.buttons,
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.lightGradient,
                                    AppColors.lightText,
                                  ])),
                          child: const Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
