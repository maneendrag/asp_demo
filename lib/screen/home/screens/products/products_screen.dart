import 'package:asp_base/screen/home/home_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
class ProductsScreen extends StatelessWidget {
  bool isFromCategories;
  String categoryName;
  ProductsScreen({Key? key, this.isFromCategories = false, this.categoryName = ""}) : super(key: key);

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ),
  ))
      .toList();
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
                  drawer:isFromCategories == true ? null : Drawer(
                    backgroundColor: const Color(0xff1B262C),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView(
                            // Important: Remove any padding from the ListView.
                            padding: EdgeInsets.zero,
                            children: [
                               DrawerHeader(
                                decoration: BoxDecoration(
                                  color: Color(0xff1B262C),
                                ),
                                child: Image.asset("assets/logo.png"),
                              ),
                              ListTile(
                                title: const Text(
                                  'Profile',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                 model.navigateToProfileScreen();
                                },
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
                                  'Cart',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.navigateToCartScreen();
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'Orders',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.navigateToOrdersScreen();
                                },
                              ),
                              // ListTile(
                              //   title: const Text(
                              //     'Support',
                              //     style: TextStyle(color: Colors.white, fontSize: 22),
                              //   ),
                              //   onTap: () {
                              //     model.navigateToCategoriesScreen();
                              //   },
                              // ),
                              ListTile(
                                title: const Text(
                                  'Terms & Conditions',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.navigateToTCScreen();
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.navigateToPrivacyPolicyScreen();
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'About Us',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.navigateToAboutUSScreen();
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'Sign Out',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                onTap: () {
                                  model.signOut();
                                },
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, bottom: 12),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'App : V1.0.0',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    title: const Text(
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
                            model.navigateToProductDetailsScreen(index);
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
                                        color: Colors.grey,
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
