import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 720;
        final copy = _ProjectCopy();
        final shapes = _ShapesStack();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF5037FF), Color(0xFF8F41FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    copy,
                    SizedBox(height: 24),
                    Align(alignment: Alignment.centerLeft, child: shapes),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: copy),
                    SizedBox(width: 24),
                    shapes,
                  ],
                ),
        );
      },
    );
  }
}

class _ProjectCopy extends StatelessWidget {
  const _ProjectCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.shield, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text('ETHEREUM 2.0', style: TextStyle(color: Colors.white70, letterSpacing: 1.5, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Top Rating Project',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 26),
        ),
        const SizedBox(height: 8),
        const Text(
          'Trending project and high rating project created by team.',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 44,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF5037FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: () {},
            child: const Text('Learn More'),
          ),
        ),
      ],
    );
  }
}

class _ShapesStack extends StatelessWidget {
  const _ShapesStack();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 160,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10,
            left: 30,
            child: _floatingShape(const Color(0xFF6CF3FF), 60, 18),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: _floatingShape(const Color(0xFFFFC857), 40, -12),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: _floatingShape(const Color(0xFF00D1FF), 50, 8),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: _floatingShape(const Color(0xFF141E61), 88, 0, borderWidth: 8),
          ),
        ],
      ),
    );
  }

  Widget _floatingShape(Color color, double size, double tilt, {double borderWidth = 0}) {
    return Transform.rotate(
      angle: tilt * 3.1415 / 180,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: borderWidth > 0 ? Colors.transparent : color.withOpacity(.9),
          border: borderWidth > 0 ? Border.all(color: color, width: borderWidth) : null,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: color.withOpacity(.4), blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 8)),
          ],
        ),
      ),
    );
  }
}