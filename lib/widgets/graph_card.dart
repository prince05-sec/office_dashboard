import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class GraphCard extends StatelessWidget {
  final bool isCompact;
  const GraphCard({Key? key, this.isCompact = false}) : super(key: key);


  List<FlSpot> _spots() {
    return const [
      FlSpot(0, 10),
      FlSpot(1, 12),
      FlSpot(2, 9),
      FlSpot(3, 14),
      FlSpot(4, 12),
      FlSpot(5, 16),
      FlSpot(6, 13),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overall Performance', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true, bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: (v, meta) {return Text(['2015','2016','2017','2018','2019','2020','2021'][v.toInt() % 7], style: const TextStyle(fontSize: 10));})), leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: _spots(),
                    isCurved: true,
                    color: Colors.indigo,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}