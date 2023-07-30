part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}


// when wishlist is success
class WishlistSuccessState extends WishlistState {
  final List<ProductData> wishlist;
  WishlistSuccessState({
    required this.wishlist,
  });
}
