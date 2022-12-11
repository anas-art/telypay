import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view/edit_screen.dart';
import 'package:telepay/view_model/home_view_model.dart';

import '../model/product_model.dart';
import '../utility/enum.dart';

class HomeScreen extends StatefulWidget {
  bool ? apicall;
  List<ProductModel> ? list;

  HomeScreen({Key? key,required this.apicall,this.list}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildSearchResults(HomeViewModel hmv) {

    return  hmv.searchResult.isEmpty ? const Center(
      child: Text("No Data Found"),
    ): ListView.builder(
      itemCount: hmv.searchResult.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            tileColor: const Color(0xFF113d63),
            title: Row(
              children: [
                Text( hmv.searchResult[index].name.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                const SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.all(5),

                  decoration: const BoxDecoration(
                      color: Color(0xFFfed12c),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),
                          bottomRight:Radius.circular(18) )
                  ),
                  child: Center(
                    child: Text("\$ "+hmv.searchResult[index].price.toString(),
                        style: const TextStyle(
                            color:  Color(0xFF113d63),
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
            subtitle: Text(
                hmv.searchResult[index].noInStock.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            trailing: Wrap(
              spacing: 12,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                               EditPage(
                                name: hmv.searchResult[index].name,
                                 price:hmv.productList[index].price?.toDouble(),
                                stock: hmv.searchResult[index].noInStock,
                                 index: index
                              )
                          ));
                    },
                    iconSize: 15,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      print("fffffffff");
                      hmv.removeindex(index,Listtype.searchlist);
                    },
                    iconSize: 15,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBox(HomeViewModel hmv) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: hmv.controller,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: hmv.onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              hmv.controller.clear();
              hmv.onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _builuserlist(HomeViewModel hmvm) {
    return hmvm.productList.isEmpty ? const Center(
      child: Text("No Data Found"),
    ): ListView.builder(
        itemCount: hmvm.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              tileColor: const Color(0xFF113d63),
              title: Row(
                children: [
                  Text(hmvm.productList[index].name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.all(5),

                    decoration: const BoxDecoration(
                      color: Color(0xFFfed12c),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),
                          bottomRight:Radius.circular(18) )
                    ),
                     child: Center(
                       child: Text("\$ "+hmvm.productList[index].price.toString(),
                          style: const TextStyle(
                              color:  Color(0xFF113d63),
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                     ),
                  ),
                ],
              ),
              subtitle: Text("stock: "+
                  hmvm.productList[index].noInStock.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600)),
              trailing: Wrap(
                spacing: 12,
                children: [

                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 EditPage(
                                   name: hmvm.productList[index].name,
                                   price:hmvm.productList[index].price?.toDouble(),
                                   stock: hmvm.productList[index].noInStock,
                                   index: index,
                                 )));
                      },
                      iconSize: 15,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        print("df");
                        hmvm.removeindex(index,Listtype.productlist);
                      },
                      iconSize: 15,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          );
        });
  }
  HomeViewModel? homeViewModel;
@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF113d63),
        title: const Text("Home"),
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(widget.apicall,widget.list),
        child: Consumer<HomeViewModel>(
          builder: (context, hmvm, child) {
            return hmvm.loading== true? const Center(child: CircularProgressIndicator(
              backgroundColor:  Color(0xFF113d63),
              color: Color(0xFFfed12c),
            )):
            Column(
              children: [
                _buildSearchBox(hmvm),
                Expanded(
                    child: hmvm.searchResult.length != 0 || hmvm.controller.text.isNotEmpty
                        ? _buildSearchResults(hmvm)
                        : _builuserlist(hmvm)),

              ],
            );
          },
        ),
      ),
    );
  }
}
