import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/ui/product_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Items',
          style: GoogleFonts.asap(),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) =>  current is !CartActionState,
        builder: (context, state) {
          switch (state.runtimeType){
            case CartSuccessState:
            final successState = state as CartSuccessState;
            return  ListView.builder(
            itemCount: successState.cartItems.length,
            itemBuilder: (context, index){
            return CartTile(
              cartBloc: cartBloc,
              productData: successState.cartItems[index]);
          }); 
          }
          return Container();
        },
      ),
    );
  }
}
