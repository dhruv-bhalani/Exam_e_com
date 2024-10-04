import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practical_exam/views/extensions.dart';
import '../utills/product_utills.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map product = ModalRoute.of(context)?.settings.arguments as Map;
    Color iconColor = Colors.black;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: const Text(
          'About Product',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Image(
            image: NetworkImage(product['thumbnail']),
          ),
          20.toHeight(),
          Align(
            alignment: Alignment.center,
            child: Text(
              product['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          5.toHeight(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 10, color: Colors.grey, blurRadius: 20)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    const Text(
                      "Product information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    5.toHeight(),
                    1.toHeight(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Price: ${product['price']} \$",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    5.toHeight(),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: RatingBar.builder(
                              initialRating: product['rating'].toDouble(),
                              direction: Axis.vertical,
                              itemSize: 20,
                              allowHalfRating: true,
                              itemCount: 1,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                          Text(
                            "${product['rating']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.toHeight(),
                    Divider(),
                    Text(
                      product['description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    10.toHeight(),
                    Divider(),
                    Text(
                      "Category: ${product['category']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Brand: ${product['brand']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "stock: ${product['stock']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "sku: ${product['sku']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "tags: ${product['tags'].join("\t,\t")}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "dimensions: ${product['dimensions']['width']}\t\theight:${product['dimensions']['height']}\t\t depth:${product['dimensions']['depth']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "discountPercentage: ${product['discountPercentage']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "warrantyInformation: ${product['warrantyInformation']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "shippingInformation: ${product['shippingInformation']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "availabilityStatus: ${product['availabilityStatus']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    5.toHeight(),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Buy Now'),
                            style: const ButtonStyle(),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (!cartitem.contains(product)) {
                                cartitem.add(product);
                                product['qty'] = 1;
                              }
                            },
                            child: const Text('Add To Cart'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
