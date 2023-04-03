import 'package:asp_base/screen/home/screens/product_details/product_details_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsScreen extends StatelessWidget {
  int? productID;

  ProductDetailsScreen({Key? key, this.productID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onViewModelReady: (model) => model.getProductDetailsData(productID!),
        builder: (context, model, child) {
          return model.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.yellow,
                ))
              : SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12,),
                        CarouselSlider(
                            options: CarouselOptions(
                              height: 220,
                              aspectRatio: 2,
                              viewportFraction: 0.9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              onPageChanged: null,
                              scrollDirection: Axis.horizontal,
                            ),
                          items:
                              model.productsDetailsResponsei!.images!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.amber),
                                    child: Image.network(
                                      i,
                                      fit: BoxFit.cover,
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 22,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              model.productsDetailsResponsei!.title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                              SizedBox(height: 12,),
                            Text(
                              "\$ ${model.productsDetailsResponsei!.price!.toString()}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                              SizedBox(height: 22,),
                            Text(
                              model.productsDetailsResponsei!.description!,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                              SizedBox(height: 22,),
                            Text(
                              "Rating ${model.productsDetailsResponsei!.rating.toString()!}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}
