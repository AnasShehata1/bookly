import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text('Search Results', style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
