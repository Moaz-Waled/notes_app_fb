import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/login_view.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_category/add_category_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Notes'),
          actions: [
            BlocConsumer<NotesCubit, NotesState>(
              listener: (context, state) {
                if (state is SignOutSuccess) {
                  Get.offAll(
                    () => LoginView(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 300),
                  );
                }
              },
              builder: (context, state) {
                final notesCubit = context.read<NotesCubit>();
                return state is SignOutLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : IconButton(
                        onPressed: () {
                          notesCubit.signOut();
                        },
                        icon: Icon(Icons.logout),
                      );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => AddCategoryView(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: HomeBody(),
      ),
    );
  }
}
