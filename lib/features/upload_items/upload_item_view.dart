import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/services/shared_prefs_helper.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/core/widgets/custom_buttom.dart';
import 'package:recycle_app/features/upload_items/widgets/custom_text_field.dart';

class UploadItemView extends StatefulWidget {
  const UploadItemView({super.key, required this.category, required this.id});

  final String category, id;

  @override
  State<UploadItemView> createState() => _UploadItemViewState();
}

class _UploadItemViewState extends State<UploadItemView> {
  TextEditingController addressController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  String? id, name;
  getTheSharedPref()async{

    id = await SharedPrefsHelper().getUserId();
    name = await SharedPrefsHelper().getUserName();
    setState(() {
      
    });

  }

  @override
  void initState() {
    getTheSharedPref();
    super.initState();
  }




  Future getImage() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      setState(() {});
    }
  }


  @override
  void dispose() {
    addressController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 5.5),
                  Text("Upload Item", style: AppText.headLineTextStyle(24)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 233, 249),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    selectedImage != null
                        ? Center(
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black45, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.file(selectedImage!, fit: BoxFit.cover)),
                          ),
                        )
                        : GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Center(
                            child: Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                    SizedBox(height: 50),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Enter your Address you want the item to be picked.",
                        style: AppText.normalTextStyle(18),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: addressController,
                      hintText: "Enter your Address",
                      prefixIcon: Icons.location_on,
                    ),

                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Enter the Quantity of item to be picked.",
                        style: AppText.normalTextStyle(18),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: quantityController,
                      hintText: "Enter Quantity",
                      prefixIcon: Icons.inventory,
                    ),

                    SizedBox(height: 60),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: CustomButtom(
                          onPressed: () async {
                            if (
                                addressController.text.isNotEmpty &&
                                quantityController.text.isNotEmpty) {
                              String itemId = randomAlphaNumeric(10);

                            //  Reference firebaseStorageRef = FirebaseStorage
                             //     .instance
                             //     .ref("blogImage")
                              //    .child(itemId);
                            //  final UploadTask uploadTask = firebaseStorageRef
                              //    .putFile(selectedImage!);
                              // var dawnloadUrl =
                              //     await (await uploadTask).ref.getDownloadURL();

                              Map<String, dynamic> addItem = {
                                "Image": "dawnloadUrl",
                                "Address": addressController.text,
                                "Quantity": quantityController.text,
                                "UserId": id,
                                "Name": name,
                                "Status": "Pending",
                              };
                              await DataBaseService().addUserUploadItem(addItem, id!, itemId);
                              await DataBaseService().addAdminItem(addItem, itemId);
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  
                                  content: Text("Item Uploaded Successfully",style: AppText.whiteTextStyle(20),)),
                              );
                              setState(() {
                                addressController.clear();
                                quantityController.clear();
                                selectedImage = null;
                              });
                            }
                          },
                          title: "Upload",
                          fontSize: 28,
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
    );
  }
}
