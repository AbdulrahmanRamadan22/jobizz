import 'package:flutter/material.dart';
import 'package:jobizz/core/widgets/generic_search_delegate.dart';

void showGenericSearchDialog<T>({
  required BuildContext context,
  required List<T> items,
  required List<String Function(T)> searchFields,
  required Widget Function(BuildContext, T) itemBuilder,
  String searchHint = 'Search...',
  void Function(T)? onItemSelected,
  bool isGrid = true,
}) {
  showSearch<T?>(
    context: context,
    delegate: GenericSearchDelegate<T>(
      items: items,
      searchFields: searchFields,
      itemBuilder: itemBuilder,
      onItemSelected: (selectedItem) {
        onItemSelected?.call(selectedItem);

        if (onItemSelected == null && selectedItem != null) {
          String display = "Selected item";
          if (searchFields.isNotEmpty) {
            display = searchFields.first(selectedItem);
          } else {
            display = selectedItem.toString();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: $display')),
          );
        }
      },
      isGrid: isGrid,
    ),
  );
}
