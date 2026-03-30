import 'package:flutter/material.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/features/user_profile/widgets/profile_card.dart';

class AreasAndExpertise extends StatelessWidget {
  const AreasAndExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          title: 'Cloud Infrastructure',
          icon: Icons.cloud_outlined,
          description: 'AWS, Azure, GCP Expert',
        ),
        verticalspace(12),
        ProfileCard(
          title: 'Cyber Security',
          icon: Icons.shield,
          description: 'Zero Trust Architecture',
        ),
        verticalspace(12),
        ProfileCard(
          title: 'ML/AI Ops',
          icon: Icons.psychology_outlined,
          description: 'Pipeline Automation',
        ),
        verticalspace(12),
        ProfileCard(
          title: 'Open Source',
          icon: Icons.terminal,
          description: 'Active Core Contributor',
        ),
        verticalspace(12),
      ],
    );
  }
}
