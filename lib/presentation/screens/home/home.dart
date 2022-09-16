import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/product/product_cubit.dart';
import 'package:shop/presentation/screens/home/product_list.dart';
import 'package:shop/presentation/widgets/loaders/loader.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shop',
          style: textStyles.headline6?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          state.maybeMap(
            failure: (state) {
              final error = state.networkException;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error?.message ?? 'Something went wrong',
                  ),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (
          context,
          state,
        ) {
          final fetchProducts = context.read<ShopCubit>().fetchProducts;

          return RefreshIndicator(
            onRefresh: fetchProducts,
            child: state.maybeWhen(
              loading: () => const Loader(),
              failure: (_, products) => ProductListView(
                products: products,
                onTapLoadData: fetchProducts,
              ),
              success: (products) => ProductListView(
                products: products,
                onTapLoadData: fetchProducts,
              ),
              orElse: () => const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
