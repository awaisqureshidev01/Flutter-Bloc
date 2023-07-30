import 'package:bloc_practice/features/cart/ui/cart_screen.dart';
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/home/ui/product_cart.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }
  
  //creating instance of bloc
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
//wrapped scaffold with bloc consumer widget
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartScreenPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
        }
        else if(state is HomeNavigateToWishlistScreenPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const WishListScreen()));
        }
        else if(state is HomeProductCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item added to Cart')));
        }
        else if(state is HomeProductWishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item added to Favorites')));
        }
      },
      builder: (context, state) {
        //using switch statements to use our methods
        switch(state.runtimeType){
         //case 1
          case HomeLoadingState:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );

          //case 2
          case HomeLoadedSuccessState:
          final successState = state as HomeLoadedSuccessState;
          return Scaffold(
          //app bar
          appBar: AppBar(
            title:  Text('Capital Mobile Shop',style: GoogleFonts.asap(),),
            actions: [
              // icon button of heart for navigating to wishlist screen
              IconButton(onPressed: (){
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              }, icon:const Icon(CupertinoIcons.heart)),
               // icon button of cart for navigating to cart screen
              IconButton(onPressed: (){
                homeBloc.add((HomeCartButtonNavigateEvent()));
              }, icon: const Icon(CupertinoIcons.cart)),
            ],
          ),
          body: ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context, index){
            return ProductCart(
              homeBloc: homeBloc,
              productData: successState.products[index]);
          }),
        );

      //case 3
      case HomeErrorState:
      return Scaffold(
        body: Center(child: Text('Error Occurred', style: GoogleFonts.asap(),),),
      );
      default: 
      return const SizedBox();
        }
              },
    );
  }
}

