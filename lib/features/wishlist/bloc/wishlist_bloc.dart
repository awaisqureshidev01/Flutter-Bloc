import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/wishlist_item.dart';
import 'package:bloc_practice/features/home/model/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishRemoveFromWishlistEvent>(wishRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
   emit(WishlistSuccessState(wishlist: wishlistItem));
  }

  FutureOr<void> wishRemoveFromWishlistEvent(WishRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
   wishlistItem.remove(event.productData);
   emit(WishlistSuccessState(wishlist: wishlistItem));
  }
}
