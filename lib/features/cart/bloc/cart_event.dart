// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

// removing item from cart screen
class CartRemoveFromCartEvent extends CartEvent {
  final ProductData productData;
  CartRemoveFromCartEvent({
    required this.productData,
  });
}
