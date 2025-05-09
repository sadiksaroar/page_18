import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GroceryStoreScreen(),
    );
  }
}

class GroceryStoreScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "name": "Pearl Milling",
      "price": "\$163.00",
      "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
    },
    {
      "name": "Double Chocolate",
      "price": "\$163.00",
      "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
    },
    {
      "name": "Crust Frozen",
      "price": "\$134.00",
      "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
    },
    {
      "name": "California Pizza",
      "price": "\$105.00",
      "image": "GroceryStoreScreen/Link → 1-30-500x500.jpg.png"
    }
  ];

  final List<String> bannerImages = [
    "GroceryStoreScreen/Image (1).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Center(child: Text("Store")),
        actions: [
          IconButton(
            icon: const Icon(Icons.cabin),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('GroceryStoreScreen/Image.png'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Grocery Store',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.verified, color: Colors.blue),
                const Spacer(),
                ChoiceChip(
                  backgroundColor: Colors.grey,
                  label: const Text("Best Sell", style: TextStyle(color: Colors.black)),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 15),
              ],
            ),
            const Text('104 Products • 1.3k Followers'),
            const SizedBox(height: 13),
            Row(
              children: [
                ChoiceChip(
                  label: const Text("Main Page", style: TextStyle(color: Colors.green)),
                  selected: true,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 30),
                ChoiceChip(
                  label: const Text("All Products", style: TextStyle(color: Colors.green)),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 30),
                ChoiceChip(
                  label: const Text("Best Sell", style: TextStyle(color: Colors.green)),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: bannerImages.map((item) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Center(
                      child: Positioned(
                        // bottom: 10,
                        // right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "35% Discount",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                products[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index]['name']!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(products[index]['price']!)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 9,
                        right: 9,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite_border, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
          
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.message),),
    );
  }
}
