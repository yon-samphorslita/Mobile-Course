import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final String location;
  final String count;

  const CourseDetail({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.location,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 101, height: 98),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF595959),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Color(0xFF595959),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF595959),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.group,
                        size: 14,
                        color: Color(0xFF595959),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        count,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF595959),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'See more...',
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
