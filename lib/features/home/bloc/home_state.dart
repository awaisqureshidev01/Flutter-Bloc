// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

// in this class we will add loading widget that will load the screen
// while products are being fetched or updated 
class HomeLoadingState extends HomeState{}

// in this class we will add the logic of success of updating/fetching products
class HomeLoadedSuccessState extends HomeState {
  //fetching list when loading is success
  final List<ProductData> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

// in this class we will display error in case of failure
class HomeErrorState extends HomeState{}

// in this class we will navigate to wishlist screen
class HomeNavigateToWishlistScreenPageActionState extends HomeActionState{}


// in this class we will navigate to cart screen
class HomeNavigateToCartScreenPageActionState extends HomeActionState{}

// for home products to add in wishlist
class HomeProductWishlistActionState extends HomeActionState{}

// for home products to add in cart
class HomeProductCartActionState extends HomeActionState{}

