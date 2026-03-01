import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class RecruiterDashboardScreen extends StatefulWidget {
  const RecruiterDashboardScreen({super.key});

  @override
  State<RecruiterDashboardScreen> createState() => _RecruiterDashboardScreenState();
}

class _RecruiterDashboardScreenState extends State<RecruiterDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B152A), // Slightly darker bg for recruiter
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
                    _buildSearchBar(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildCandidatesList()),
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
            const Text('Acme Corp.', style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
            const SizedBox(height: 4),
            Text('Talent Search',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24)),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=200&h=200&fit=crop'), // Company logo
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(LucideIcons.search, color: AppTheme.textSecondary, size: 20),
          SizedBox(width: 12),
          Text('Search candidates by skill...',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildCandidatesList() {
    return ListView(
      clipBehavior: Clip.none,
      children: [
        _buildCandidateCard('Sarah Jenkins', 'Frontend Engineer', '96%', AppTheme.accentNeonGreen),
        const SizedBox(height: 16),
        _buildCandidateCard('David Chen', 'Fullstack Dev', '88%', AppTheme.accentElectricBlue),
      ],
    );
  }

  Widget _buildCandidateCard(String name, String role, String score, Color scoreColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderStroke),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(role, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(score, style: TextStyle(color: scoreColor, fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('Match', style: TextStyle(color: AppTheme.textSecondary, fontSize: 10)),
            ],
          ),
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
            _buildTabItem(0, LucideIcons.users, 'CANDIDATES', isSelected: _selectedIndex == 0),
            _buildTabItem(1, LucideIcons.barChart, 'ANALYTICS', isSelected: _selectedIndex == 1),
            _buildTabItem(2, LucideIcons.settings, 'SETTINGS', isSelected: _selectedIndex == 2),
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
