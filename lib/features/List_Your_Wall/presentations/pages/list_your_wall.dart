import 'dart:io';

import 'package:app/core/constants/colors.dart';
import 'package:app/core/constants/strings.dart';
import 'package:app/features/available_walls/presentations/pages/Navigation_bar.dart';
import 'package:app/shared/styles/app_text_styles.dart';
import 'package:app/shared/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/widgets/wall_card.dart';
import '../../../../shared/widgets/map_widget.dart';

class ListWallsPage extends StatefulWidget {
  @override
  _ListWallsPageState createState() => _ListWallsPageState();
}

class _ListWallsPageState extends State<ListWallsPage> {
  int _currentIndex = 0;
  bool isAvailable = false;

  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.ListYourWall,
          style: AppTextStyles.h2,
        ),
        backgroundColor: colors.primaryLight,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Admin Profile clicked!')),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: colors.primaryLight,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            color: colors.backgroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.upload_file,
                              size: 40,
                              color: colors.primaryLight,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Upload Wall Photo',
                              style: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text('Camera'),
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                ),
                                TextButton.icon(
                                  icon: const Icon(Icons.photo),
                                  label: const Text('Gallery'),
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (_pickedImage != null)
                              Image.file(
                                File(_pickedImage!.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    WallCard(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: isAvailable,
                          onChanged: (value) {
                            setState(() {
                              isAvailable = value ?? false;
                            });
                          },
                        ),
                        Text(
                          'Availability',
                          style: AppTextStyles.h4.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    const MapWidget(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          label: AppStrings.CreateAd,
                          color: colors.activeGreen,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Buy action initiated!')),
                            );
                          },
                        ),
                        CustomButton(
                          label: AppStrings.cancel,
                          color: colors.cancelRed,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Action canceled!')),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
