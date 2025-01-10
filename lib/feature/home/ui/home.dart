import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/feature/cart/bloc/ui/cart.dart';
import 'package:learnbloc/feature/home/ui/bloc/home_bloc.dart';
import 'package:learnbloc/feature/wishList/bloc/ui/wishList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wishlist(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                automaticallyImplyLeading: false,
                title: Text("MY Grocery App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductWishListButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
