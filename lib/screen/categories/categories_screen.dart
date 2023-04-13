import 'package:asp_base/screen/categories/categories_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math show Random;

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      onViewModelReady: (model)=> model.getCategories(),
      viewModelBuilder: ()=> CategoriesViewModel(),
      builder: (context, model, child) {
        return model.isBusy == true
            ? const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ))
            : Scaffold(
            body: Column(
              children: [
                SizedBox(height: model.sizeConfigService.widthMultiplier * 8.2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("Categories",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemCount: model.categoriesResponseList.length,
                  itemBuilder: (context,index){
                   return GestureDetector(
                     onTap: (){
                       model.navigateToProductsScreen(model.categoriesResponseList[index]);
                     },
                     child: Container(
                       margin: const EdgeInsets.only(left: 12, right: 12,bottom: 22),
                        decoration: BoxDecoration(
                          color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                          child: Text(model.categoriesResponseList[index],
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        ),
                      ),
                   );
        }),
                ),
              ],
            ));
      },);
  }
}
