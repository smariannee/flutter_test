import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/presentation/cubits/Category_state.dart';
import 'package:flutter_application_2/repository/Category_repository.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;
  
  CategoryCubit({required this.repository}): super(CategoryInitial());

  Future<void> getCategory(String id) async {
    try {
      emit(CategoryLoading());      
      final category = await repository.getCategory(id);
      emit(CategorySuccess(categories: [category]));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}