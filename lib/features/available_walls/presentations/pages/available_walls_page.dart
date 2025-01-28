import 'package:app/core/constants/colors.dart';
import 'package:app/core/constants/strings.dart';
import 'package:app/features/available_walls/presentations/pages/Navigation_bar.dart';
import 'package:app/shared/styles/app_text_styles.dart';
import 'package:app/shared/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/wall_card.dart';
import '../../../../shared/widgets/map_widget.dart';

class AvailableWallsPage extends StatefulWidget {
  @override
  _AvailableWallsPageState createState() => _AvailableWallsPageState();
}

class _AvailableWallsPageState extends State<AvailableWallsPage> {
  int _currentIndex = 0;
  bool isAvailable = false;

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
          AppStrings.availableWalls,
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
                              color: colors.activeGreen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Active',
                              style: AppTextStyles.subtitle1.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
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
                          'Availability Identity',
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
                          label: AppStrings.buy,
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
