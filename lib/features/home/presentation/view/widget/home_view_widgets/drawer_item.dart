import 'package:flutter/widgets.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/style.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: PaddingSize.s20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: AppSize.s10),
            Text(title, style: StyleManager.headLine3),
          ],
        ),
      ),
    );
  }
}
