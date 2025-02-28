import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app1/home/models/product.dart';
import 'package:flutter_app1/home/repositories/product_repository.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository = ProductRepository();
  
  ProductBloc() : super(ProductsInitial()) {
    on<FetchFeaturedProducts>(_onFetchFeaturedProducts);
    on<FetchProductsByCategory>(_onFetchProductsByCategory);
  }
  
  Future<void> _onFetchFeaturedProducts(
    FetchFeaturedProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await repository.getTopRatedProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError('Failed to load products: ${e.toString()}'));
    }
  }
  
  Future<void> _onFetchProductsByCategory(
    FetchProductsByCategory event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await repository.getProductsByCategory(event.category);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError('Failed to load products: ${e.toString()}'));
    }
  }
}
