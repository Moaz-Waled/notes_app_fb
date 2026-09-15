import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/category_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/widgets/category_item.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/rename_category/rename_category_view.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List categories = [];

  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.defaultSize == null) {
      SizeConfig().init(context);
    }
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is GetCategoryDataFailure) {
            AppSnackbar.showSnackbar(message: state.errMessage);
          }
          if (state is GetCategoryDataSuccess) {
            categories = state.categories;
          }
          if (state is DeleteCategoryFailure) {
            AppSnackbar.showSnackbar(message: state.errMessage);
          }
          if (state is DeleteCategorySuccess) {
            AppSnackbar.showSnackbar(message: state.message);
            context.read<NotesCubit>().getCategories();
          }
        },
        builder: (context, state) {
          final notesCubit = context.read<NotesCubit>();
          return state is GetCategoryDataLoading ||
                  state is DeleteCategoryLoading
              ? Center(child: CircularProgressIndicator(color: Colors.orange))
              : categories.isEmpty
              ? Center(
                  child: Text(
                    'No categories found.',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      title: categories[index]['categoryName'],
                      onDeletePressed: () {
                        notesCubit.deleteCategory(
                          categoryId: categories[index].id,
                        );
                      },
                      onEditPressed: () {
                        Get.to(
                          () => RenameCategoryView(
                            categoryName: categories[index]['categoryName'],
                            categoryId: categories[index].id,
                          ),
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 300),
                        );
                      },
                      onTap: () {
                        Get.to(
                          () => CategoryView(
                            categoryName: categories[index]['categoryName'],
                            categoryId: categories[index].id,
                          ),
                          transition: Transition.fade,
                          duration: Duration(milliseconds: 300),
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
