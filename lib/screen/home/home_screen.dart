import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/screen/home/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: ()=>HomeScreenViewModel(),
        // onViewModelReady: (model) => model.getHomeProducts(),
        builder: (context, model,child){
      switch(model.currentView){
        case ProductsScreenView.homeScreen:
          return Placeholder();
        case ProductsScreenView.productDetailsScreen:
          return const Scaffold(
            body: Center(child: Text("Product details Screen"),),
          );


      }

        });

  }

  // @override
  // Widget build(BuildContext context) {
  //   return ViewModelBuilder<HomeScreenViewModel>.reactive(
  //       viewModelBuilder: () => HomeScreenViewModel(),
  //       onViewModelReady: (model) => model.getHomeProducts(),
  //       builder: (context, model, child) {
  //         return model.isBusy == true
  //             ? const Center(
  //                 child: CircularProgressIndicator(
  //                 color: Colors.red,
  //               ))
  //             : Scaffold(
  //                 body: SafeArea(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(right: 12,left: 4),
  //                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children:  [
  //                             Row(children: const [
  //                               IconButton(
  //                                   onPressed: null,
  //                                   icon: Icon(
  //                                     Icons.arrow_back_ios_new_rounded,
  //                                     color: Colors.white,
  //                                   )),
  //                               Text(
  //                                 "Products",
  //                                 style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 32),
  //                               ),
  //                             ],),
  //                             IconButton(onPressed: ()=> model.navigateToEditProfileScreen(), icon: Icon(Icons.menu, color: Colors.white,))
  //                           ],
  //                         ),
  //                       ),
  //                       // Expanded(
  //                       //   child: ListView.builder(itemCount: model.productsResponseList.length,
  //                       //     itemBuilder: (context, index){
  //                       //     return Text(model.productsResponseList[index].title!,
  //                       //       style: TextStyle(
  //                       //           color: Colors.white,
  //                       //           fontWeight: FontWeight.bold,
  //                       //           fontSize: 12),);
  //                       //   },),
  //                       // )
  //                       Expanded(
  //                         child: GridView.count(
  //                             crossAxisCount: 2,
  //                             crossAxisSpacing: 12.0,
  //                             mainAxisSpacing: 12.0,
  //                             // childAspectRatio: 0.9,
  //                             padding: const EdgeInsets.symmetric(
  //                                 horizontal: 14, vertical: 12),
  //                             children: List.generate(
  //                                 model.productsResponseList.length, (index) {
  //                               return GestureDetector(
  //                                 onTap: (){
  //                                   model.navigateToProductDetailsScreen();
  //                                 },
  //                                 child: Container(
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.circular(12)
  //                                   ),
  //                                   child: Padding(
  //                                     padding: const EdgeInsets.symmetric(
  //                                         horizontal: 12, vertical: 12),
  //                                     child: Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Expanded(
  //                                           child: Center(
  //                                             child: Container(
  //                                               color: Colors.white,
  //                                               child: Image.network(
  //                                                 model
  //                                                     .productsResponseList[index].images![0],
  //                                                 fit: BoxFit.fill,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         const SizedBox(
  //                                           height: 16,
  //                                         ),
  //                                         // Container(
  //                                         //   color: Colors.white,
  //                                         //   child: Flexible(
  //                                         //     child: RichText(
  //                                         //       overflow: TextOverflow.ellipsis,
  //                                         //       strutStyle:
  //                                         //           StrutStyle(fontSize: 12.0),
  //                                         //       text: TextSpan(
  //                                         //           style: const TextStyle(
  //                                         //               color: Colors.black,
  //                                         //               fontWeight:
  //                                         //                   FontWeight.bold),
  //                                         //           text: model
  //                                         //               .productsResponseList[
  //                                         //                   index]
  //                                         //               .title!),
  //                                         //     ),
  //                                         //   ),
  //                                         // ),
  //                                         SizedBox(
  //                                           height: 4,
  //                                         ),
  //                                         Text(
  //                                           "\$${model.productsResponseList[index].price.toString()}",
  //                                           style: TextStyle(
  //                                               color: Colors.black,
  //                                               fontWeight: FontWeight.bold,
  //                                               fontSize: 18),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
  //                               );
  //                             })),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //       });
  // }
}
