import 'package:bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Items',
          style: GoogleFonts.asap(),
        ),
      ),
         body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) =>  current is !WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType){
            case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
            return  ListView.builder(
            itemCount: successState.wishlist.length,
            itemBuilder: (context, index){
            return WishlistTile(
              wishlistBloc: wishlistBloc,
              productData: successState.wishlist[index]);
          }); 
          }
          return Container();
        },
      ),
   
    );
  }
}