import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/item_list_bloc.dart';
import './add_item_view.dart';
import './item_list_view.dart';
import '../schemas/item.dart';
import 'item_list_from_realm_result_using_bloc_widget.dart';

class ShoppingListView extends StatelessWidget {
  final Function(String) onAdd;
  final Function(Item) onToggle;
  final Function(Item) onDelete;
  final List<Item> items;
  const ShoppingListView(
      {Key? key,
      required this.onAdd,
      required this.onToggle,
      required this.onDelete,
      required this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.indigoAccent])),
      child: Column(children: [
        AddItemView(
          onAdd: onAdd,
        ),
        Flexible(
          child: SizedBox(
            height: 350,
            child: ItemListView(
              items: items,
              onToggle: onToggle,
              onDelete: onDelete,
            ),
          ),
        ),
        const Text('Realm Result Data'),
        Flexible(
          child: BlocProvider(
            create: (context) => ItemListBloc(),
            child: const ItemListFromRealmResultUsingBlocWidget(),
          ),
        )
      ]),
    );
  }
}
