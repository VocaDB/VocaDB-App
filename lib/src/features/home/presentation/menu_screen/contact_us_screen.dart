import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: Text('Contact us'),
      ),
      body: ResponsiveCenter(
        child: Text(
          'Contact us',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
