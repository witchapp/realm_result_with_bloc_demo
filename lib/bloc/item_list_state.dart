part of 'item_list_bloc.dart';

abstract class ItemListState extends Equatable {
  const ItemListState();

  @override
  List<Object> get props => [];
}

class ItemListInitial extends ItemListState {
  const ItemListInitial();

  @override
  List<Object> get props => [];
}

class ItemListLoadingState extends ItemListState {
  const ItemListLoadingState();

  @override
  List<Object> get props => [];
}

class ItemListSubscribed extends ItemListState {
  final List itemList;

  const ItemListSubscribed({required this.itemList});

  @override
  List<Object> get props => [itemList];
}

class ItemListErrorState extends ItemListState {
  const ItemListErrorState();

  @override
  List<Object> get props => [];
}
