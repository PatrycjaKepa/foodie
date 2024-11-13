import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;
  final List<String> units;
  final Function addIngredient;
  final Function(int) removeIngredient;
  final Function(int, int) reorderIngredients;

  const IngredientList({
    super.key,
    required this.ingredients,
    required this.units,
    required this.addIngredient,
    required this.removeIngredient,
    required this.reorderIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Składniki',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nazwa składnika'),
                    onChanged: (value) => ingredients[index]['name'] = value,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Ilość'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => ingredients[index]['amount'] = value,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: ingredients[index]['unit'],
                    items: units.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        ingredients[index]['unit'] = value;
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Jednostka'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => removeIngredient(index),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () => addIngredient(),
          icon: const Icon(Icons.add),
          label: const Text('Dodaj składnik'),
        ),
      ],
    );
  }
}
