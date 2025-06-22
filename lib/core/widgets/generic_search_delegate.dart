import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:lottie/lottie.dart';

class GenericSearchDelegate<T> extends SearchDelegate<T?> {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T)? onItemSelected;
  final List<String Function(T)> searchFields;

  final bool isGrid;

  GenericSearchDelegate({
    required this.items,
    required this.itemBuilder,
    this.onItemSelected,
    required this.searchFields,
    this.isGrid = true,
  }) : super(
            searchFieldLabel: 'Search...',
            searchFieldDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: true,
              hintStyle: TextStyles.font16DarkBlackSemiBold,
              labelStyle: TextStyles.font16DarkBlackSemiBold,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults(context);

  Widget _buildSearchResults(BuildContext context) {
    final results = _filterItems();

    if (results.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // add lottie
          Lottie.asset(
            'assets/lottie/no_fount_search.json',
            width: 200,
            height: 200,
          ),

          Center(
            child: Text(
              'No results found for "$query"',
              style: TextStyles.font16DarkBlackSemiBold,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: isGrid
          ? GridView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = results[index];
                return GestureDetector(
                  onTap: () {
                    onItemSelected?.call(item);
                    close(context, item);
                  },
                  child: itemBuilder(context, item),
                );
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = results[index];
                return GestureDetector(
                  onTap: () {
                    // onItemSelected?.call(item);
                    close(context, item);
                  },
                  child: itemBuilder(context, item),
                );
              },
            ),
    );
  }

  List<T> _filterItems() {
    if (query.isEmpty) return items;

    final lowerCaseQuery = query.toLowerCase();

    return items.where((item) {
      return searchFields.any(
        (getter) => getter(item).toLowerCase().contains(lowerCaseQuery),
      );
    }).toList();
  }
}
