part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

// removing item from wish screen
class WishRemoveFromWishlistEvent extends WishlistEvent {
  final ProductData productData;
  WishRemoveFromWishlistEvent({
    required this.productData,
  });
}
