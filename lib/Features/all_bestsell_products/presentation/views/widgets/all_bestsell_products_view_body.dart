import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/helper_functions/get_dummy_product.dart';
import 'package:fruit_market/Core/widgets/search_textfeild.dart';
import 'package:fruit_market/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/best_selling_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllBestSellProductsViewBody extends StatefulWidget {
  const AllBestSellProductsViewBody({super.key});

  @override
  State<AllBestSellProductsViewBody> createState() =>
      _AllBestSellProductsViewBodyState();
}

class _AllBestSellProductsViewBodyState
    extends State<AllBestSellProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(children: [SearchTextfeild(), SizedBox(height: 12)]),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return Skeletonizer.sliver(
                  enabled: true,
                  child: BestSellingGrid(products: getDummyProducts()),
                );
              } else if (state is ProductsError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                );
              } else if (state is ProductsLoaded) {
                return BestSellingGrid(products: state.products);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
