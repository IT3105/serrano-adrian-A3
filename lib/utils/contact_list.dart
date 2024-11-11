import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.deleteFunction,
    required this.editFunction,
  });

  final String name;
  final String email;
  final String phone;
  final Function(BuildContext) deleteFunction;
  final VoidCallback editFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          color: const Color(0xFF629584), // #629584 (Muted Green)
          elevation: 5,
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: const Color(0xFF243642), // #243642 (Dark Blue)
                  borderRadius: BorderRadius.circular(15),
                ),
                SlidableAction(
                  onPressed: (_) => editFunction(),
                  icon: Icons.edit,
                  backgroundColor: const Color(0xFF387478), // #387478 (Teal Green)
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column for contact details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color(0xFFE2F1E7), // #E2F1E7 (Pale Green)
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                          maxLines: 1, // Limit to one line
                        ),
                        const SizedBox(height: 5),
                        Text(
                          email,
                          style: const TextStyle(
                            color: Color(0xFFE2F1E7), // #E2F1E7 (Pale Green)
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                          maxLines: 1, // Limit to one line
                        ),
                        const SizedBox(height: 5),
                        Text(
                          phone,
                          style: const TextStyle(
                            color: Color(0xFFE2F1E7), // #E2F1E7 (Pale Green)
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                          maxLines: 1, // Limit to one line
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
