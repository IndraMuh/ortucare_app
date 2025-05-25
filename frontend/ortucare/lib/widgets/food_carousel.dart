import 'package:flutter/material.dart';
import 'package:ortucare/models/food_model.dart';
import 'package:ortucare/widgets/const.dart';

class FoodCarousel extends StatelessWidget {
  final List<FoodModel> foodList;

  const FoodCarousel({super.key, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final food = foodList[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: pinkTua.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                // 🍽 Gambar makanan di bagian atas
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      'assets/${food.poster}',
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // 📄 Konten teks
                Positioned(
                  top: 130,
                  left: 16,
                  right: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.time, // Contoh: "Breakfast"
                        style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        food.hook, // Contoh: "Chicken and Vegetables"
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        food.hook_desc, // Contoh: "Healthy breakfast for your kids"
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // ❤️ Ikon favorit di pojok kanan bawah
                const Positioned(
                  bottom: 16,
                  right: 16,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.pink,
                    size: 28,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
