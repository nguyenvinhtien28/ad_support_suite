import 'package:flutter/cupertino.dart';

class ViewMultiple extends StatelessWidget {
  const ViewMultiple({
    Key? key,
    required this.viewOne,
    this.viewTwo,
    this.viewThree,
  }) : super(key: key);

  final Widget viewOne;
  final Widget? viewTwo;
  final Widget? viewThree;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        viewOne,
        viewTwo ?? const SizedBox(),
        viewThree ?? const SizedBox(),
      ],
    );
  }
}
