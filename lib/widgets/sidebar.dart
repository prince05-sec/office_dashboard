import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool asDrawer;
  const Sidebar({Key? key, this.asDrawer = true}) : super(key: key);

  Widget _buildContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
// Logo area
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('AS', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              const Text('Adstacks', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              CircleAvatar(radius: 24, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=15')),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pooja Mishra', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Admin', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _NavItem(icon: Icons.home, label: 'Home', selected: true),
                _NavItem(icon: Icons.people, label: 'Employees'),
                _NavItem(icon: Icons.calendar_today, label: 'Attendance'),
                _NavItem(icon: Icons.bar_chart, label: 'Summary'),
                _NavItem(icon: Icons.info, label: 'Information'),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text('WORKSPACES', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ),
                _NavItem(icon: Icons.dashboard, label: 'Adstacks'),
                _NavItem(icon: Icons.account_balance, label: 'Finance'),
              ],
            ),
          ),
          const Divider(),
          _NavItem(icon: Icons.settings, label: 'Setting'),
          _NavItem(icon: Icons.logout, label: 'Logout'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = _buildContent();
    if (asDrawer) {
      return Drawer(elevation: 0, child: content);
    }
    return content;
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavItem({Key? key, required this.icon, required this.label, this.selected = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: selected ? Colors.indigo : Colors.grey.shade600),
      title: Text(label, style: TextStyle(color: selected ? Colors.indigo : Colors.black87, fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
      horizontalTitleGap: 0,
      minLeadingWidth: 0,
    );
  }
}