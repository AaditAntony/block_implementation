import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learnbloc/data/cart_items.dart';
import 'package:learnbloc/data/grocery_data.dart';
import 'package:learnbloc/data/wishlit_items.dart';
import 'package:learnbloc/feature/home/ui/model/home_product_data_mode.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);

    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    print(GroceryData.groceryItems
        .map((e) => ProductDataMode(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              image: e['image'],
            ))
        .toList());
    print("it should be emitted");
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryItems
            .map((e) => ProductDataMode(
                  id: e['id'] ?? '0.0',
                  name: e['name'] ?? '0.0',
                  description: e['description'] ?? "his si",
                  price: e['price'] ?? 2.3,
                  image: e['image'] ?? "ok is i",
                ))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickEvent(
      HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    print('wish list product clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print('cart product  clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart  navigate event');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wish list naviagate event');
    emit(HomeNavigateToWishListPageActionState());
  }
}
