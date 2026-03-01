import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import 'recruiter_dashboard.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Status area padding and custom content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
                    _buildMetricsScroll(),
                    const SizedBox(height: 24),
                    _buildUploadCta(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Praphul', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('Your Skill Hub', style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Secret navigation to Recruiter for MVP demo purposes
            Navigator.push(context, MaterialPageRoute(builder: (_) => const RecruiterDashboardScreen()));
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop'),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          _buildMetricCard('Skill Match', '85%', AppTheme.accentNeonGreen),
          const SizedBox(width: 16),
          _buildMetricCard('Market Demand', 'High', AppTheme.accentElectricBlue),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, Color valueColor) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderStroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontFamily: 'Inter')),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: valueColor, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Inter')),
        ],
      ),
    );
  }

  Widget _buildUploadCta() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppTheme.accentElectricBlue, Color(0xFF007BFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Update Resume', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Get better job matches', style: TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const Icon(LucideIcons.upload, color: Colors.white, size: 32),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(21, 12, 21, 21),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: AppTheme.borderStroke),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            _buildTabItem(0, LucideIcons.home, 'HOME', isSelected: _selectedIndex == 0),
            _buildTabItem(1, LucideIcons.briefcase, 'JOBS', isSelected: _selectedIndex == 1),
            _buildTabItem(2, LucideIcons.bookOpen, 'LEARN', isSelected: _selectedIndex == 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, IconData icon, String label, {required bool isSelected}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.accentElectricBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: isSelected ? AppTheme.background : AppTheme.textSecondary),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: isSelected ? AppTheme.background : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
