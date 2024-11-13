import 'package:flutter/material.dart';

class StepList extends StatelessWidget {
  final List<String> steps;
  final VoidCallback addStep;
  final void Function(int) removeStep;
  final void Function(int, int) reorderSteps;

  const StepList({
    super.key,
    required this.steps,
    required this.addStep,
    required this.removeStep,
    required this.reorderSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kroki przepisu',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ReorderableListView(
          shrinkWrap: true,
          onReorder: reorderSteps,
          children: [
            for (int index = 0; index < steps.length; index++)
              ListTile(
                key: ValueKey(index),
                title: TextFormField(
                  initialValue: steps[index],
                  onChanged: (value) {
                    steps[index] = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Krok ',
                    border: OutlineInputBorder(),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => removeStep(index),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: addStep,
          child: const Text('Dodaj krok'),
        ),
      ],
    );
  }
}