import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';


class MyCustomDropdownWidget<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final String? Function(T)? itemToImage;
  final ValueChanged<T?> onChanged;
  final bool isError;
  final double height;
  final double iconSize;
  final String hint;

  const MyCustomDropdownWidget({super.key, 
    required this.title,
    required this.items,
    this.selectedItem,
    required this.itemToString,
    this.itemToImage,
    required this.onChanged,
    this.isError = false,
    this.height = 54.0,
    this.iconSize = 30.0,
    this.hint = "Select",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            color: isError ? Colors.red : ColorConstants.textPrimary,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: height,
          child: DropdownButtonFormField<T>(
            value: selectedItem,
            hint: Text(hint),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200], // Set your gray background color
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Add curved radius
                borderSide: BorderSide.none, // Remove border stroke
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Add curved radius
                borderSide: BorderSide.none, // Remove border stroke
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Add curved radius
                borderSide: BorderSide.none, // Remove border stroke
              ),
            ),
            isExpanded: true,
            dropdownColor: Colors.white,
            iconSize: iconSize,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorConstants.accentColor,
              size: iconSize,
            ),
            elevation: 4,
            items: items.map<DropdownMenuItem<T>>((T value) {
              String? imageUrl = itemToImage != null ? itemToImage!(value) : null;
              return DropdownMenuItem<T>(
                value: value,
                child: Row(
                  children: [
                    if (imageUrl != null && imageUrl.isNotEmpty)
                      Image.network(
                        imageUrl,
                        width: 34,
                        height: 34,
                      ),
                    SizedBox(width: imageUrl != null && imageUrl.isNotEmpty ? 10 : 0),
                    Expanded(
                      child: Text(
                        itemToString(value),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: ColorConstants.textPrimary),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}




