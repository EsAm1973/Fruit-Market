import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/helper_functions/get_dummy_product.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Core/widgets/search_textfeild.dart';
import 'package:fruit_market/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/best_selling_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SearchTextfeild()),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              // احسب العدد بحسب الحالة (عند التحميل ممكن تعرض صفر أو عدد dummy)
              final int count =
                  state is ProductsLoaded
                      ? state.products.length
                      : state is ProductsLoading
                      ? getDummyProducts().length
                      : 0;

              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$count نتائج', style: AppTextStyles.bold16),
                      SvgPicture.asset(
                        Assets.imagesFilter,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // GRID: يبقى كما كان (مهم أن BestSellingGrid تُرجع Sliver)
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
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
