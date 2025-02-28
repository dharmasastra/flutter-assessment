part of 'bloc_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> topProducts;
  
  ProductsLoaded(this.topProducts);
  
  @override
  List<Object> get props => [topProducts];
}

class ProductsError extends ProductState {
  final String message;
  
  ProductsError(this.message);
  
  @override
  List<Object> get props => [message];
}
