import 'package:flutter/material.dart';

class StatSummaryRow extends StatelessWidget {
  const StatSummaryRow({super.key});

  static final List<_StatData> _stats = [
    _StatData(
      title: 'All Projects',
      value: 32,
      suffix: '',
      icon: Icons.auto_graph,
      color: const Color(0xFF7C5CFF),
      deltaPercent: 12.5,
      isPositive: true,
    ),
    _StatData(
      title: 'In Review',
      value: 14,
      suffix: '',
      icon: Icons.rule_folder,
      color: const Color(0xFF5CE1E6),
      deltaPercent: -3.0,
      isPositive: false,
    ),
    _StatData(
      title: 'Team Members',
      value: 82,
      suffix: '',
      icon: Icons.people_alt,
      color: const Color(0xFFFF8E53),
      deltaPercent: 8.2,
      isPositive: true,
    ),
    _StatData(
      title: 'Upcoming Tasks',
      value: 19,
      suffix: '',
      icon: Icons.list_alt,
      color: const Color(0xFF63F5B5),
      deltaPercent: 1.6,
      isPositive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: _stats.map((data) => _MetricCard(data: data)).toList(),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final _StatData data;
  const _MetricCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final cardColor = data.color.withOpacity(.12);
    final deltaColor = data.isPositive ? const Color(0xFF42E4A3) : const Color(0xFFFF7B7B);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 900),
      tween: Tween(begin: 0, end: data.value),
      builder: (context, animatedValue, child) {
        final valueText = animatedValue >= 100 || animatedValue % 1 == 0
            ? animatedValue.toStringAsFixed(0)
            : animatedValue.toStringAsFixed(1);
        return Container(
          width: 220,
          constraints: const BoxConstraints(minWidth: 160),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 12, offset: const Offset(0, 10)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14)),
                child: Icon(data.icon, color: data.color, size: 20),
              ),
              const SizedBox(height: 14),
              Text(
                '$valueText${data.suffix}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(data.title, style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    data.isPositive ? Icons.arrow_outward : Icons.south_east,
                    color: deltaColor,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${data.deltaPercent.abs().toStringAsFixed(1)}%',
                    style: TextStyle(color: deltaColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 4),
                  Text('vs last week', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class _StatData {
  final String title;
  final double value;
  final String suffix;
  final IconData icon;
  final Color color;
  final double deltaPercent;
  final bool isPositive;

  const _StatData({
    required this.title,
    required this.value,
    required this.suffix,
    required this.icon,
    required this.color,
    required this.deltaPercent,
    required this.isPositive,
  });
}
