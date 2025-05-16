import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class UploadItemView extends StatefulWidget {
  const UploadItemView({super.key});

  @override
  State<UploadItemView> createState() => _UploadItemViewState();
}

class _UploadItemViewState extends State<UploadItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                     padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/5.5,),
                  Text("Upload Item",style: AppText.headLineTextStyle(24),),
                ],
              ),
            ),
            SizedBox(height: 20,),
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
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black45,width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 30,),
                    )
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