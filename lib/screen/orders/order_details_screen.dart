import 'package:flutter/material.dart';

import 'orders_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  Orders? orders;
  OrderDetailsScreen({Key? key, this.orders});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
            "Orders Details",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
            const SizedBox(
              height: 12,
            ),
            Divider(height: 12, color: Colors.white,),
            const SizedBox(
          height: 22,
        ),
   const Text(
            "Order ID: ",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
            const SizedBox(
              height: 12,
            ),
            Text(
            orders!.orderId!.toString() ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 16),
          ) ,
                const SizedBox(
          height: 22,
        ),
   const Text(
            "Total Orders Items: ",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
            const SizedBox(
              height: 12,
            ),
            Text(
            orders!.totalOrderdItems!.toString() ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 16),
          ) ,

            const SizedBox(
          height: 22,
        ),
   const Text(
            "Total Orders Price: ",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
            const SizedBox(
              height: 12,
            ),
            Text(
            "\$ ${orders!.totalOrderPrice!.toString()}" ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 16),
          ),

            const SizedBox(
          height: 22,
        ),
   const Text(
            "Date Ordered: ",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
            const SizedBox(
              height: 12,
            ),
            Text(
            "${DateTime.parse(orders!.createdAt!).month}-${DateTime.parse(orders!.createdAt!).day}-${DateTime.parse(orders!.createdAt!).year}"
             ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 16),
          ), const SizedBox(
          height: 22,
        ),
   const Text(
            "Ordered Address: ",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
            const SizedBox(
              height: 12,
            ),
            Text(
            orders!.address
             ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 16),
          ),

        ],),
      ),
    ),);
  }
}
