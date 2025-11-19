import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import '../widgets/all_projects_card.dart';
import '../widgets/calendar_card.dart';
import '../widgets/creators_card.dart';
import '../widgets/graph_card.dart';
import '../widgets/project_card.dart';
import '../widgets/project_status_chart.dart';
import '../widgets/sidebar.dart';
import '../widgets/stat_summary_row.dart';
import '../widgets/topbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FB),
      drawer: isMobile ? const Sidebar() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile)
              const SizedBox(
                width: 260,
                child: Sidebar(asDrawer: false),
              ),
            Expanded(
              child: Column(
                children: [
                  TopBar(showMenu: isMobile),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProjectCard(),
                          const SizedBox(height: 20),
                          const StatSummaryRow(),
                          const SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final isTight = constraints.maxWidth < 900;
                              if (isTight) {
                                return Column(
                                  children: const [
                                    AllProjectsCard(),
                                    SizedBox(height: 24),
                                    CreatorsCard(),
                                  ],
                                );
                              }
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(flex: 3, child: AllProjectsCard()),
                                  SizedBox(width: 24),
                                  Expanded(flex: 2, child: CreatorsCard()),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final stackCharts = constraints.maxWidth < 1100;
                              if (stackCharts) {
                                return Column(
                                  children: const [
                                    GraphCard(),
                                    SizedBox(height: 24),
                                    ProjectStatusChart(),
                                  ],
                                );
                              }
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Expanded(flex: 3, child: GraphCard()),
                                  SizedBox(width: 24),
                                  Expanded(flex: 2, child: ProjectStatusChart()),
                                ],
                              );
                            },
                          ),
                          if (!isDesktop) ...const [
                            SizedBox(height: 24),
                            CalendarCard(),
                            SizedBox(height: 24),
                          ],
                          if (!isDesktop)
                            const _MobileEventStack(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isDesktop)
              const SizedBox(
                width: 320,
                child: _RightRail(),
              ),
          ],
        ),
      ),
    );
  }
}

class _RightRail extends StatelessWidget {
  const _RightRail();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0D1A3A),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _RightRailHeader(),
          const SizedBox(height: 24),
          const CalendarCard(),
          const SizedBox(height: 24),
          _EventCard(
            title: 'Today Birthday',
            total: 2,
            accent: const Color(0xFFFFC857),
            actionLabel: 'Birthday Wishing',
            people: _birthdayPeople,
          ),
          const SizedBox(height: 20),
          _EventCard(
            title: 'Anniversary',
            total: 3,
            accent: const Color(0xFF9B7BFF),
            actionLabel: 'Anniversary Wishing',
            people: _anniversaryPeople,
          ),
        ],
      ),
    );
  }
}

class _RightRailHeader extends StatelessWidget {
  const _RightRailHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('GENERAL', style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 1.5)),
              SizedBox(height: 4),
              Text('10:00 AM TO 7:00 PM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.wb_sunny_outlined, color: Colors.white70, size: 18),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_none, color: Colors.white70, size: 18),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final int total;
  final Color accent;
  final String actionLabel;
  final List<_Person> people;

  const _EventCard({
    required this.title,
    required this.total,
    required this.accent,
    required this.actionLabel,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [accent.withOpacity(.9), const Color(0xFF140C3A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              Text('Total | $total', style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          ...people.map((person) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    CircleAvatar(radius: 20, backgroundImage: NetworkImage(person.avatar)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(person.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 2),
                          Text(person.role, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    Icon(Icons.star, color: accent, size: 18),
                  ],
                ),
              )),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E1F56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {},
              child: Text(actionLabel),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileEventStack extends StatelessWidget {
  const _MobileEventStack();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _EventCard(
          title: 'Today Birthday',
          total: 2,
          accent: const Color(0xFFFFC857),
          actionLabel: 'Birthday Wishing',
          people: _birthdayPeople,
        ),
        const SizedBox(height: 20),
        _EventCard(
          title: 'Anniversary',
          total: 3,
          accent: const Color(0xFF9B7BFF),
          actionLabel: 'Anniversary Wishing',
          people: _anniversaryPeople,
        ),
      ],
    );
  }
}

const List<_Person> _birthdayPeople = [
  _Person(name: 'Joan M.', role: 'Product Lead', avatar: 'https://i.pravatar.cc/150?img=31'),
  _Person(name: 'Walt T.', role: 'QA Engineer', avatar: 'https://i.pravatar.cc/150?img=23'),
];

const List<_Person> _anniversaryPeople = [
  _Person(name: 'Aria K.', role: '3 yrs • Ops', avatar: 'https://i.pravatar.cc/150?img=5'),
  _Person(name: 'Liam P.', role: '2 yrs • Dev', avatar: 'https://i.pravatar.cc/150?img=18'),
  _Person(name: 'Ella F.', role: '1 yr • HR', avatar: 'https://i.pravatar.cc/150?img=44'),
];

class _Person {
  final String name;
  final String role;
  final String avatar;
  const _Person({required this.name, required this.role, required this.avatar});
}