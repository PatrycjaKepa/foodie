import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  final void Function(Uint8List?) onImagePicked;

  const UploadPhoto({
    super.key, 
    required this.onImagePicked
    });

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  Uint8List? imageBytes;

  Future<void> imageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      imageBytes = await image.readAsBytes();
      setState(() {});
      widget.onImagePicked(imageBytes);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Wybierz z galerii'),
                onTap: () {
                  imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 450,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        child: imageBytes != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.memory(
                  imageBytes!,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                ),
              )
            : const Center(
                child: Text(
                  '! Zdjęcie powinno być pionowe żeby dobrze wyglądało :)',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
      ),
    );
  }
}
