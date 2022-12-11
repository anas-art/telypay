import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view_model/edit_view_model.dart';

import '../model/product_model.dart';

class EditPage extends StatefulWidget {
  final String ? name;
  final double ? price;
  final int ? stock;
  final int ? index;
  EditPage({Key? key,required this.name,required this.price,required this.stock,this.index}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    print("name  ${widget.name}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        backgroundColor:   Color(0xFF113d63),
      ),
      body: ChangeNotifierProvider<EditViewModel>(
        create: (_)=>EditViewModel(widget.name, widget.price, widget.stock,widget.index),
        child: Consumer<EditViewModel>(
          builder: (context,edvm,child){
            return Padding(
              padding: EdgeInsets.all(10) ,
              child: Column(

                children: [
                  Container(

                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      color: Color(0xFF113d63),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          TextFormField(
                            controller: edvm.namecontroller,
                            // autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 15),


                              border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedErrorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              errorMaxLines: 1,
                              errorStyle: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,

                                  color: Colors.white),
                              hintText:  "name",
                              hintStyle:  TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),

                              labelText: "name",
                              labelStyle: TextStyle(
                                  color: Colors.white,fontSize: 12 ,fontWeight: FontWeight.w500
                              ),
                              isDense: true,                      // Added this
                            ),
                            validator: (String? value) {
                              // if(widget.autovalidateMode != AutovalidateMode.disabled){
                              //   if(widget.textFormFieldType != TextFormFieldType.confirmPassword){
                              //     return  FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "");
                              //   }else{
                              //     return FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "",stringToBeCompared: widget.stringToBeCompared);
                              //
                              //   }
                              // }
                            },
                            onChanged: (text) {
                              // if(widget.onChanged!=null){
                              //   widget.onChanged!(text);
                              // }

                            },
                            keyboardType:TextInputType.emailAddress,
                            inputFormatters:[ FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'
                              ),
                            ),],

                            // readOnly: widget.textFormFieldType == TextFormFieldType.dateOfBirth ? true : false,
                          ),

                          TextFormField(
                            controller: edvm.pricecontroller,
                            // autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 15),


                              border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedErrorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              errorMaxLines: 1,
                              errorStyle: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,

                                  color: Colors.white),
                              hintText:  "price",
                              hintStyle:  TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),

                              labelText: "price",
                              labelStyle: TextStyle(
                                  color: Colors.white,fontSize: 12 ,fontWeight: FontWeight.w500
                              ),
                              isDense: true,                      // Added this
                            ),
                            validator: (String? value) {
                              // if(widget.autovalidateMode != AutovalidateMode.disabled){
                              //   if(widget.textFormFieldType != TextFormFieldType.confirmPassword){
                              //     return  FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "");
                              //   }else{
                              //     return FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "",stringToBeCompared: widget.stringToBeCompared);
                              //
                              //   }
                              // }
                            },
                            onChanged: (text) {
                              // if(widget.onChanged!=null){
                              //   widget.onChanged!(text);
                              // }

                            },
                            keyboardType:TextInputType.phone,
                            inputFormatters:[ FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'
                              ),
                            ),],

                            // readOnly: widget.textFormFieldType == TextFormFieldType.dateOfBirth ? true : false,
                          ),

                          TextFormField(
                            controller: edvm.stockcontroller,
                            // autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 15),


                              border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedErrorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color:Colors.white)),
                              errorMaxLines: 1,
                              errorStyle: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,

                                  color: Colors.white),
                              hintText:  "stock",
                              hintStyle:  TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),

                              labelText: "stock",
                              labelStyle: TextStyle(
                                  color: Colors.white,fontSize: 12 ,fontWeight: FontWeight.w500
                              ),
                              isDense: true,                      // Added this
                            ),
                            validator: (String? value) {
                              // if(widget.autovalidateMode != AutovalidateMode.disabled){
                              //   if(widget.textFormFieldType != TextFormFieldType.confirmPassword){
                              //     return  FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "");
                              //   }else{
                              //     return FormValidator.isValid(
                              //         widget.textFormFieldType, value ?? "",stringToBeCompared: widget.stringToBeCompared);
                              //
                              //   }
                              // }
                            },
                            onChanged: (text) {
                              // if(widget.onChanged!=null){
                              //   widget.onChanged!(text);
                              // }

                            },
                            keyboardType:TextInputType.phone,
                            inputFormatters:[ FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'
                              ),
                            ),],

                            // readOnly: widget.textFormFieldType == TextFormFieldType.dateOfBirth ? true : false,
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width:  230,
                    height:  55,
                    child: TextButton(
                      style: TextButton.styleFrom(

                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // <-- Radius
                          ),
                          backgroundColor: const Color(0xFF113d63)),
                      onPressed: () {
                        final name= edvm.namecontroller.text.trim();
                        final price = edvm.pricecontroller.text.trim();
                        final stock = edvm.stockcontroller.text.trim();

                        final product = ProductModel(price: double.parse(price),name: name,noInStock: int.parse(stock));

                        edvm.editdatas(context,product);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFfed12c),),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
