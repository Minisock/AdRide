import 'package:app/core/constants/colors.dart';
import 'package:app/core/constants/strings.dart';
import 'package:app/features/available_walls/presentations/pages/Navigation_bar.dart';
import 'package:app/shared/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/wall_card.dart';
import '../../../../shared/widgets/map_widget.dart';

class YourWallPage extends StatefulWidget {
  @override
  _YourWallPageState createState() => _YourWallPageState();
}

class _YourWallPageState extends State<YourWallPage> {
  int _currentIndex = 0;
  bool isAvailable = true;

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create an instance of AppColors to use instance-based color access
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
          AppStrings.YourWall,
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
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/wall_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: colors.activeYellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Listed',
                              style: AppTextStyles.subtitle1.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    WallCard(),
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
                          'ITEM LISTED',
                          style: AppTextStyles.h4.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    const MapWidget(),
                    const SizedBox(height: 10),
                    // Button added here
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Show success message as a Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Success! Redirected to dashboard.'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.blackbutton,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'View at my Dashboard',
                          style: AppTextStyles.h4.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
