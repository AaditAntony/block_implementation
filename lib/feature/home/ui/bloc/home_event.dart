part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {}

class HomeProductCartButtonClickEvent extends HomeEvent {}

class HomeProductWishListButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}
