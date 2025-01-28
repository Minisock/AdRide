import 'package:app/core/constants/strings.dart';
import 'package:app/shared/widgets/input_fields/Input_field.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';


class WallCard extends StatefulWidget {
  @override
  _WallCardState createState() => _WallCardState();
}

class _WallCardState extends State<WallCard> {

  final wallOwnerController = TextEditingController();
  final locationController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Container(
      color: colors.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InputField(
                label: AppStrings.wallOwner,
                hintText: 'Enter Wall Owner Name',
                keyboardType: TextInputType.text,
                controller: wallOwnerController,
              ),
              const SizedBox(height: 10),

              InputField(
                label: AppStrings.location,
                hintText: 'Enter Location',
                keyboardType: TextInputType.text,
                controller: locationController,
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: InputField(
                      label: AppStrings.height,
                      hintText: 'Height in ft',
                      keyboardType: TextInputType.number,
                      controller: heightController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputField(
                      label: AppStrings.width,
                      hintText: 'Width in ft',
                      keyboardType: TextInputType.number,
                      controller: widthController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InputField(
                label: AppStrings.monthlyPrice,
                hintText: 'Enter price per month',
                keyboardType: TextInputType.text,
                controller: locationController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      label: AppStrings.availabilityDate,
                      hintText: 'From',
                      readOnly: true,
                      controller: fromDateController,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            fromDateController.text =
                                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputField(
                      label: '',
                      hintText: 'To',
                      readOnly: true,
                      controller: toDateController,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            toDateController.text =
                                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
