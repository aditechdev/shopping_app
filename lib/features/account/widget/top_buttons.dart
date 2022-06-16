import 'package:flutter/material.dart';
import 'package:shopping_app/features/account/widget/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtons(
              btnText: 'Your Orders ',
              onTap: () {},
            ),
            AccountButtons(
              btnText: 'Turn Sellers ',
              onTap: () {},
            ),
          ],
        ),
       const  SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButtons(
              btnText: 'Log Out ',
              onTap: () {},
            ),
            AccountButtons(
              btnText: 'Your wishlist ',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
