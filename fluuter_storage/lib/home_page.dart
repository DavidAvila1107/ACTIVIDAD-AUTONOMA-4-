import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluuter_storage/services/camera_image.dart';
import 'package:fluuter_storage/services/select_image.dart';

class homepage extends StatefulWidget {
  const homepage({
    super.key,
  });

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          imagen_to_upload != null
              ? Image.file(imagen_to_upload!)
              : Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10),
                ),
          ElevatedButton(
              onPressed: () async {
                final image = await getImage();
                setState(() {
                  imagen_to_upload = File(image!.path);
                });
              },
              child: const Text("Seleccionar imagen")),
          ElevatedButton(
              onPressed: () async {
                final foto = await getPhoto();
                setState(() {
                  imagen_to_upload = File(foto!.path);
                });
              },
              child: const Text("Abrir camara")),
          ElevatedButton(
              onPressed: () async {}, child: const Text("Subir a firebase"))
        ],
      ),
    );
  }
}
