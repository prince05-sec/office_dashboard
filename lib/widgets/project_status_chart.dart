import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectStatusChart extends StatelessWidget {
  const ProjectStatusChart({super.key});

  static final List<_StatusSlice> _slices = [
    _StatusSlice(label: 'Pending', value: 25, color: const Color(0xFFFFC857)),
    _StatusSlice(label: 'In Progress', value: 40, color: const Color(0xFF7C5CFF)),
    _StatusSlice(label: 'Project Done', value: 35, color: const Color(0xFF63F5B5)),
  ];

  double get total => _slices.fold(0, (prev, slice) => prev + slice.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 12, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Project Status Overview', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.auto_awesome, size: 16, color: Color(0xFF7C5CFF)),
                    SizedBox(width: 6),
                    Text('Insights', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 58,
                startDegreeOffset: -20,
                sections: _slices
                    .map(
                      (slice) => PieChartSectionData(
                        color: slice.color,
                        value: slice.value,
                        showTitle: false,
                        radius: 70,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: _slices
                .map(
                  (slice) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 10, height: 10, decoration: BoxDecoration(color: slice.color, shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Text(slice.label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 6),
                      Text('${slice.value.toStringAsFixed(0)}%', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class _StatusSlice {
  final String label;
  final double value;
  final Color color;

  const _StatusSlice({required this.label, required this.value, required this.color});
}
