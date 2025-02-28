part of 'bloc_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFeaturedProducts extends ProductEvent {}

class FetchProductsByCategory extends ProductEvent {
  final String category;
  
  FetchProductsByCategory(this.category);
  
  @override
  List<Object> get props => [category];
}
