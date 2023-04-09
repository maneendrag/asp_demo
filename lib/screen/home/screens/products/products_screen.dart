import 'package:asp_base/screen/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductsScreen extends StatelessWidget {
  bool isFromCategories;
  String categoryName;
  ProductsScreen({Key? key, this.isFromCategories = false, this.categoryName = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: ()=>HomeScreenViewModel(),
        onViewModelReady: (model) => model.getHomeProducts(categoryName,isFromCategoriesScreen:  isFromCategories),
        builder: (context, model, child) {
          return model.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : Scaffold(
                  drawer: Drawer(
                    backgroundColor: const Color(0xff1B262C),
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: [
                        const DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Text(
                            'E Shop',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Categories',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          onTap: () {
                            model.navigateToCategoriesScreen();
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Item 2',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    title: Text(
                      "Products",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  body: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      // childAspectRatio: 0.9,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      children: List.generate(model.productsResponseList.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            model.navigateToProductDetailsScreen(index + 1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        color: Colors.white,
                                        child: Image.network(
                                          model.productsResponseList[index]
                                              .images![0],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  // Container(
                                  //   color: Colors.white,
                                  //   child: Flexible(
                                  //     child: RichText(
                                  //       overflow: TextOverflow.ellipsis,
                                  //       strutStyle:
                                  //           StrutStyle(fontSize: 12.0),
                                  //       text: TextSpan(
                                  //           style: const TextStyle(
                                  //               color: Colors.black,
                                  //               fontWeight:
                                  //                   FontWeight.bold),
                                  //           text: model
                                  //               .productsResponseList[
                                  //                   index]
                                  //               .title!),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "\$${model.productsResponseList[index].price.toString()}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                );
        });
  }
}
