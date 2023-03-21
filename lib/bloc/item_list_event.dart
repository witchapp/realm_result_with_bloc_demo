part of 'item_list_bloc.dart';

abstract class ItemListEvent extends Equatable {
  const ItemListEvent();

  @override
  List<Object> get props => [];
}

class ItemListInitializedEvent extends ItemListEvent {
  const ItemListInitializedEvent();

  @override
  List<Object> get props => [];
}

