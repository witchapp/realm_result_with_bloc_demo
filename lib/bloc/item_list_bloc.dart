import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/item_service.dart';

part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc() : super(const ItemListInitial()) {
    on<ItemListInitializedEvent>(_testSubscribeDataFromRealmResult);
  }

  Future<void> _testSubscribeDataFromRealmResult(
    ItemListEvent event,
    Emitter<ItemListState> emit,
  ) async {
    try {
      var realmResult = ItemService().getItems();
      emit(const ItemListLoadingState());
      await emit.forEach(
        realmResult.changes,
        onData: (realmResultChanged) {
          debugPrint('listen stream change');
          return ItemListSubscribed(itemList: realmResultChanged.results.toList());
        },
        onError: (error, stackTrace) {
          debugPrint('listen error => $error');
          return const ItemListErrorState();
        },
      );
    } catch (e) {
      print('sunscribe realm result failed: $e');
    }
  }
}
