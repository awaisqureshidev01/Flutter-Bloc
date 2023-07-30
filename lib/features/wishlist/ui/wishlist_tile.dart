import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/home/model/product_model.dart';
import 'package:bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistTile extends StatelessWidget {
  final ProductData productData;
  final WishlistBloc wishlistBloc;
  const WishlistTile({
    super.key,
    required this.productData,
    required this.wishlistBloc,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: Card(
      elevation: 8,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productData.imageUrl))
              ),
            ),
            const SizedBox(height: 5,),
            Text(productData.name, style: GoogleFonts.asap(fontSize: 16,fontWeight: FontWeight.bold),),
            Text(productData.description, style: GoogleFonts.asap(fontSize: 14,),),
            const SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs. " + productData.price.toString(), style: GoogleFonts.asap(fontSize: 14,fontWeight: FontWeight.bold),),
              Row(
                children: [
              IconButton(onPressed: (){
                // homeBloc.add(HomeWishlistButtonClickedEvent(
                //   clickedProduct: productData
                // ));
                wishlistBloc.add(WishRemoveFromWishlistEvent(
                  productData: productData,
                ));
              }, icon:const Icon(CupertinoIcons.heart_fill)),
              IconButton(onPressed: (){
                // homeBloc.add(HomeCartButtonClickedEvent(
                //   clickedProduct: productData
                // ));
                
                
              }, icon: const Icon(CupertinoIcons.cart)),
                ],
              )
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}