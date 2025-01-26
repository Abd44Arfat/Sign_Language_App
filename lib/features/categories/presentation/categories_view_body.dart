import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/presentation/manager/cubit/categories_cubit.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of image paths
    final List<String> imagePaths = [
      'assets/images/intoduce_your_self.svg',
      'assets/images/body_parts.svg',
      'assets/images/hobbies.svg',
      'assets/images/favourites.svg',
      'assets/images/public_blaces.svg',
      'assets/images/nature.svg',
    ];

    return GridViewBlocConsumer(imagePaths: imagePaths);
  }
}

class GridViewBlocConsumer extends StatefulWidget {
  const GridViewBlocConsumer({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  State<GridViewBlocConsumer> createState() => _GridViewBlocConsumerState();
}

class _GridViewBlocConsumerState extends State<GridViewBlocConsumer> {
  List<CategoryModel> CategoriesList = [];

  @override
  Widget build(BuildContext context) {
    // Trigger fetching categories when the widget is built
    context.read<CategoriesCubit>().fetchDictionaryList();

    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesFailure) {
          // Optionally show a snackbar or dialog with the error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              state.errMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            )),
          );
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: state.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoriesItem(
                category: state.categories[index],
                imagePath: widget.imagePaths[index % widget.imagePaths.length],
              );
            },
          );
        } else {
          return Center(
              child: Text(
            'No categories available.',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ));
        }
      },
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final String imagePath;
  final CategoryModel category;

  const CategoriesItem(
      {super.key, required this.imagePath, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.LevelsView, arguments: {
          'categoryId': category.id,
          'categoryName': category.name
        }
            // Pass category ID as an argument
            );
      },
      child: Container(
        height: 190,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryFixed
            //const Color(0xff202F36),
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.name,
                  style: TextStyles.font16GraySemibold.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(
                height: 14,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: SvgPicture.asset(
                    imagePath,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
