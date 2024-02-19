import 'package:flutter/material.dart';

import '../../utils/resources/theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppTheme.textColor,
      decoration:  InputDecoration(
          hintText: "Search Message",
          hintStyle: AppTheme.smallHead,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: const Icon(Icons.search,color: AppTheme.smallText,)
      ),
    );
  }
}