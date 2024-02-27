import 'package:flutter/material.dart';

import '../../../utils/resources/theme.dart';

class CreateBusinessCardDocumentPage extends StatefulWidget {
  const CreateBusinessCardDocumentPage({super.key});

  @override
  State<CreateBusinessCardDocumentPage> createState() => _CreateBusinessCardDocumentPageState();
}

class _CreateBusinessCardDocumentPageState extends State<CreateBusinessCardDocumentPage> {
  String? _selectedDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0,
      backgroundColor: AppTheme.backColor,
      titleSpacing:-15,
      leadingWidth: 60,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30,)),
      title: Text("Create Card",style: AppTheme.pageHead,),
    ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.backColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              height: 60,width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5,color: AppTheme.smallText),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Text("Choose Document",style: AppTheme.fieldText2,),
                  Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: AppTheme.backColor,
                      style:AppTheme.fieldText,
                      elevation: 1,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,color: AppTheme.smallText,size: 30,),
                      hint: const Row(
                        children: [
                          Icon(Icons.receipt_long_outlined),
                          SizedBox(width: 10,),
                          Text("Choose Document")
                        ],
                      ),
          underline: Container(),
          value: _selectedDocument,
          items: const [
            DropdownMenuItem<String>(
              value: "Aadhar Card",
              child: Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text("Aadhar Card")
                ],
              ),),
            DropdownMenuItem<String>(
              value: "GST Bills",
              child:  Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text("GST Bills")
                ],
              ),),
            DropdownMenuItem<String>(
              value: "Property Document",
              child:  Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text("Property Document")
                ],
              ),),
            DropdownMenuItem<String>(
              value: "Building Number",
              child:  Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text("Building Number")
                ],
              ),),

          ], onChanged: (String? value){
          setState(() {
            _selectedDocument = value;
          });
        },
        ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            if(_selectedDocument=="Aadhar Card")
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  //color: Colors.blue,
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Aadhar No.",style: AppTheme.smallHead,),
                    TextFormField(
                      initialValue: "2345667543567",
                      cursorColor: AppTheme.textColor,
                      style: AppTheme.tabText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                          suffix: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.green,),padding: EdgeInsets.all(0),),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          )
                      ),
                    )
                  ],
                ),
              ),
            if(_selectedDocument=="GST Bills")
              Container(
                height: 100,
                width: double.infinity,
               decoration: const BoxDecoration(
                 //color: Colors.green,
               ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("GST No.",style: AppTheme.smallHead,),
                    TextFormField(
                      initialValue: "12855938668",
                      cursorColor: AppTheme.textColor,
                      style: AppTheme.tabText,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                        suffix:IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.green,)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                        )
                      ),
                    )
                  ],
                ),
              ),
            if(_selectedDocument=="Property Document")
              Container(
                height: 100,
                width: double.infinity,
               decoration: const BoxDecoration(
                 //color: Colors.yellow,
               ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Document No.",style: AppTheme.smallHead,),
                    TextFormField(
                      initialValue: "12855938668",
                      cursorColor: AppTheme.textColor,
                      style: AppTheme.tabText,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          suffix: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.green,)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          )
                      ),
                    )
                  ],
                ),
              ),
            if(_selectedDocument=="Building Number")
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  //color: Colors.teal,
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Building No.",style: AppTheme.smallHead,),
                    TextFormField(
                      initialValue: "12855938668",
                      cursorColor: AppTheme.textColor,
                      style: AppTheme.tabText,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          suffix: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.green,)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                          )
                      ),
                    )
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}
