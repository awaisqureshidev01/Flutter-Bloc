// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
// event for the application just started
class HomeInitialEvent extends HomeEvent{}
 
//event for wishlist button when clicked
class HomeWishlistButtonClickedEvent extends HomeEvent {
  final ProductData clickedProduct;
  HomeWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

//event for cart button when clicked
class HomeCartButtonClickedEvent extends HomeEvent {
  final ProductData clickedProduct;
  HomeCartButtonClickedEvent({
    required this.clickedProduct,
  });
}


//event for navigation button to wishlist
class HomeWishlistButtonNavigateEvent extends HomeEvent{}

//event for navigation button to cart
class HomeCartButtonNavigateEvent extends HomeEvent{}