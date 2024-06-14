import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;
import 'package:greengrocer/src/screens/home/controller/home_controller.dart';
import 'package:greengrocer/src/screens/home/view/components/category_tile.dart';
import 'package:greengrocer/src/screens/home/view/components/item_tile.dart';
import 'package:greengrocer/src/screens/shared_widgets/app_name_widget.dart';
import 'package:greengrocer/src/screens/shared_widgets/app_shimmer.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // We can detect the location of the cart by this  GlobalKey<CartIconKey>
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  void itemSelectedCartAnimation(GlobalKey globalKey) async {
    await runAddToCartAnimation(globalKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameWidget(),
        actions: [
          // Cart button
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 15),
            child: GestureDetector(
              onTap: () {
                utilsServices.showToast(
                  title: 'My Cart',
                  message: 'This is my cart',
                );
              },
              // child: Badge(
              //   backgroundColor: CustomColors.customContrastColor,
              //   label: const Text(
              //     '2',
              //     style: TextStyle(
              //       fontSize: 12,
              //     ),
              //   ),
              child: AddToCartIcon(
                badgeOptions: const BadgeOptions(
                  //active: false
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                key: cartKey,
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            //),
          ),
        ],
      ),

      body: AddToCartAnimation(
        // To send the library the location of the Cart icon
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (addToCartAnimation) {
          // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
          runAddToCartAnimation = addToCartAnimation;
        },
        // Content
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Search products...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 24,
                  ),
                ),
              ),
            ),

            // Categories selector
            GetBuilder<HomeController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return CategoryTile(
                        category: controller.categories[index],
                        isSelected: controller.categories[index] ==
                            controller.selectedCategory,
                        onTap: () {
                          controller
                              .selectCategory(controller.categories[index]);
                        },
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 10),
                    itemCount: controller.categories.length,
                  ),
                );
              },
            ),

            // Store grid
            GetBuilder<HomeController>(builder: (controller) {
              return Expanded(
                child: controller.isLoading
                    ? GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                          10,
                          (index) => AppShimmer(
                            height: double.infinity,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: mocked_data.items.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ItemTile(
                            cartAnimationMethod: itemSelectedCartAnimation,
                            item: mocked_data.items[index],
                          );
                        },
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}