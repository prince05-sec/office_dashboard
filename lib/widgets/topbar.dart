import 'package:flutter/material.dart';


class TopBar extends StatelessWidget {
  final bool showMenu;
  const TopBar({Key? key, this.showMenu = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          if (showMenu)
            IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: const Icon(Icons.menu)),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, size: 18),
                  SizedBox(width: 8),
                  Expanded(child: Text('Search', style: TextStyle(color: Colors.grey))),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode_outlined)),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12')),
        ],
      ),
    );
  }
}