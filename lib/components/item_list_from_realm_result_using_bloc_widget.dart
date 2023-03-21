import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/item_list_bloc.dart';

class ItemListFromRealmResultUsingBlocWidget extends StatefulWidget {
  const ItemListFromRealmResultUsingBlocWidget({super.key});

  @override
  State<ItemListFromRealmResultUsingBlocWidget> createState() => _ItemListFromRealmResultUsingBlocWidgetState();
}

class _ItemListFromRealmResultUsingBlocWidgetState extends State<ItemListFromRealmResultUsingBlocWidget> {
  @override
  void initState() {
    context.read<ItemListBloc>().add(const ItemListInitializedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(builder: (context, state) {
      if(state is ItemListLoadingState) {
        return CircularProgressIndicator();
      }
      if (state is ItemListSubscribed) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: state.itemList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Text(state.itemList[index].text ?? 'null data');
            },
          ),
        );
      }
      return const Text('This is data from bloc subscribed to realm result');
    });
  }
}
