import 'package:flutter/material.dart';


class CreatorsCard extends StatelessWidget {
  final bool isCompact;
  const CreatorsCard({Key? key, this.isCompact = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Top Creators', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, idx) {
              final imageUrl = 'https://i.pravatar.cc/150?img=${10 + idx}';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    CircleAvatar(radius: 18, backgroundImage: NetworkImage(imageUrl)),
                    const SizedBox(width: 12),
                    Expanded(child: Text('Creator name #${idx + 1}')),
                    Text('4.${1 + idx}K'), // Removed const here
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}