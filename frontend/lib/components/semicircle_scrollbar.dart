import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class SemicircleScrollbar extends StatelessWidget {
  const SemicircleScrollbar({
    super.key,
    required this.controller,
    required this.list,
    required this.child,
    required this.crossAxisCount,
  });

  final Function child;
  final ScrollController controller;
  final int crossAxisCount;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final int listCount = list.length;

    return DraggableScrollbar.semicircle(
      controller: controller,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: listCount,
        itemBuilder: (context, index) {
          String? value = list[index];

          return Container(
            child: child(context, index, value, listCount),
          );
        },
      ),
    );
  }
}

// class ScrollItem extends StatelessWidget {
//   const ScrollItem({
//     super.key,
//     required this.index,
//     required this.value,
//     required this.length,
//     required this.child,
//   });

//   final Widget child;
//   final int length;
//   final int index;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme appColors =
//         context.watch<ThemeProvider>().appTheme.colorScheme;

//     return Container(
//       margin: const EdgeInsets.all(2.0),
//       alignment: Alignment.center,
//       color: appColors.surfaceVariant,
//       child: child,
//     );
//   }
// }
