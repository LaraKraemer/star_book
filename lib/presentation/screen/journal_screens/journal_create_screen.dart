import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class JournalCreateScreen extends StatelessWidget {
  const JournalCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.pop(),
        centerTitle: 'New Thought',
      ),
      body: SafeArea(
        minimum:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: deviceHeight * 0.038),
              const AddNewDetails(),
              SizedBox(height: deviceHeight * 0.038),
              SelectableTile(
                title: 'Date',
                onTap: () => context.goNamed(AppRouterName.datePickerScreen),
              ),
              SizedBox(height: deviceHeight * 0.038),
              SelectableTile(
                title: 'Mood',
                onTap: () => context.goNamed(AppRouterName.moodPickerScreen),
              ),
              SizedBox(height: deviceHeight * 0.038),
              const CustomTextFormField(
                heading: 'Title',
                label: 'Enter Mood Title',
              ),
              SizedBox(height: deviceHeight * 0.038),
              const CustomTextFormField(
                heading: 'Note',
                label: 'Write Note',
                isMultiline: true,
              ),
              SizedBox(height: deviceHeight * 0.04),
            ],
          ),
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(

          ///Todo: Here we can't pop screen or we need to handle data from pop()
          onTap: () => context.pop(),
          child: const Icon(Icons.check)),
    );
  }
}

class AddNewDetails extends StatelessWidget {
  const AddNewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: deviceWidth * 0.02),
        const Image(image: AssetImage('assets/icons/book.png'), height: 36),
        SizedBox(width: deviceWidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Details',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
              ),
            ),
            SizedBox(height: deviceHeight * 0.004),
            Text(
              'Write your today’s thought details below',
              style:
                  textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
