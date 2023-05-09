import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToListItemWidget extends StatelessWidget {
  const ToListItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.completed,
  }) : super(key: key);

  final String id;
  final String title;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('/todo-item-detail', queryParameters: {
          'todo-id': id,
        });
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlueAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                completed ? Icons.check : Icons.clear,
                color: completed ? Colors.green : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
