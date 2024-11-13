import 'package:flutter/material.dart';

class AddBasicInfo extends StatefulWidget {

    final TextEditingController nameController;
    final TextEditingController servingController;
    final TextEditingController durationController;

  const AddBasicInfo({
    super.key,
    required this.nameController,
    required this.servingController,
    required this.durationController,
  });

  @override
  State<AddBasicInfo> createState() => _AddBasicInfoState();
}


class _AddBasicInfoState extends State<AddBasicInfo> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Podstawowe informacje',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: widget.nameController,
          decoration: const InputDecoration(
            labelText: 'Nazwa przpisu',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Wprowadź nazwę przepisu';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.servingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Liczba porcji',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wprowadź liczbę porcji';
                  }
                  if (int.tryParse(value) == null) {
                    return "Wprowadź prawidłową liczbę";
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(width: 16),
            const Text(
              'osób',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Czas gotowania (min)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wprowadź czas gotowania';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Wprowadź prawidłową liczbę minut';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'minut',
              style: TextStyle(fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}