part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {
  final ProductDataMode clickedProduct;

  HomeProductWishListButtonClickEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataMode clickedProduct;

  HomeProductCartButtonClickEvent({required this.clickedProduct});
}

class HomeProductWishListButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
