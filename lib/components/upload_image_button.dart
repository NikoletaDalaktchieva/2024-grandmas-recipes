import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:project1/constants/app_colors.dart';
import 'package:project1/constants/breakpoints.dart';

class ImageUploadExample extends StatefulWidget {
  final ValueChanged<String?> onImageSelected;
  final String imageUrl;
  final double sizeHeight;

  const ImageUploadExample(this.imageUrl, this.sizeHeight,
      {Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _ImageUploadExampleState createState() =>
      _ImageUploadExampleState(imageUrl, sizeHeight);
}

class _ImageUploadExampleState extends State<ImageUploadExample> {
  String? _imageUrl;
  double sizeHeight;

  _ImageUploadExampleState(this._imageUrl, this.sizeHeight);

  void _uploadImage() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;
      if (files!.isEmpty) return;

      final reader = html.FileReader();
      reader.readAsDataUrl(files[0]);
      reader.onLoadEnd.listen((e) {
        setState(() {
          _imageUrl = reader.result as String;
        });
        widget.onImageSelected(_imageUrl); // Invoke the callback
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Breakpoints.tablet.toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: sizeHeight / 2,
            child: Center(
                child: _imageUrl == ""
                    ? const Text('No image selected.')
                    : Image.network(_imageUrl!)),
          ),
          ElevatedButton(
            onPressed: _uploadImage,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.textColor),
              foregroundColor: WidgetStateProperty.all(AppColors.elementColor),
            ),
            child: const Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
