import 'package:flutter/material.dart';

class AllProjectsCard extends StatelessWidget {
  const AllProjectsCard({super.key});

  List<_ProjectItem> get _projects => const [
        _ProjectItem(
          name: 'Technology behind the Blockchain',
          projectId: 'Project #1',
          accent: Color(0xFFFFC857),
        ),
        _ProjectItem(
          name: 'Future of Work Dashboard',
          projectId: 'Project #2',
          accent: Color(0xFF5CE1E6),
        ),
        _ProjectItem(
          name: 'Ad Creative Automation',
          projectId: 'Project #3',
          accent: Color(0xFF9B7BFF),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF101B3B),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'All Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.08),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.add, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text('New Project', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ..._projects.map((project) => _ProjectTile(project: project)),
        ],
      ),
    );
  }
}

class _ProjectItem {
  final String name;
  final String projectId;
  final Color accent;
  const _ProjectItem({required this.name, required this.projectId, required this.accent});
}

class _ProjectTile extends StatelessWidget {
  final _ProjectItem project;

  const _ProjectTile({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: project.accent.withOpacity(.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.layers, color: project.accent),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(project.projectId, style: TextStyle(color: Colors.white.withOpacity(.65), fontSize: 12)),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            onPressed: () {},
            child: const Text('See project details'),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined, color: Colors.white70, size: 18),
          ),
        ],
      ),
    );
  }
}
