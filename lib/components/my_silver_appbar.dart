import 'package:flutter/material.dart';
import 'package:food_delevery_app/pages/cart_page.dart';

class MySilverAppbar extends StatefulWidget {
  final Widget child;
  final Widget title;
  const MySilverAppbar({super.key, required this.title, required this.child});

  @override
  State<MySilverAppbar> createState() => _MySilverAppbarState();
}

class _MySilverAppbarState extends State<MySilverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const Text("HomePage1"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: widget.title,
        title: widget.child,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      ),
      expandedHeight: 340,
      collapsedHeight: 100,
      pinned: true,
      floating: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}
