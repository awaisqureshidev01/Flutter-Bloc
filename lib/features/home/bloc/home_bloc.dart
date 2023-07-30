import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cart_item.dart';
import 'package:bloc_practice/data/product_data.dart';
import 'package:bloc_practice/data/wishlist_item.dart';
import 'package:bloc_practice/features/home/model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonClickedEvent>(homeWishlistButtonClickedEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

   //method for initial event
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(products: MobileData.mobileProducts.map((e) => ProductData(
      id: e['id'], 
      imageUrl: e['imageUrl'], 
      name: e['name'], 
      description: e['description'], 
      price: e['price'])
      ).toList()));
  }

   //method for wishlist button
  FutureOr<void> homeWishlistButtonClickedEvent(HomeWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
  print('wishlist clicked');
  wishlistItem.add(event.clickedProduct);
  emit(HomeProductWishlistActionState());
  }

  //method for cart button
  FutureOr<void> homeCartButtonClickedEvent(HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
  print('Cart Clicked');
  cartItem.add(event.clickedProduct);
  emit(HomeProductCartActionState());
  }

  // method for navigation to wishlist
  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
  print('wishlist');
  emit(HomeNavigateToWishlistScreenPageActionState());
  }
   
   // method for navigation to wishlist
  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
  print('cart');
  emit(HomeNavigateToCartScreenPageActionState());
  }
   
  
}
