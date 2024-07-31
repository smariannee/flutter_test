import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/presentation/cubits/Product_state.dart';
import 'package:flutter_application_2/repository/Product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  
  ProductCubit({required this.repository}): super(ProductInitial());

  Future<void> getProducts() async {
    try {
      emit(ProductLoading());      
      final products = await repository.getProducts();
      emit(ProductSuccess(products: products));
    } catch (e) {      
      emit(ProductError(message: e.toString()));
    }
  }
}