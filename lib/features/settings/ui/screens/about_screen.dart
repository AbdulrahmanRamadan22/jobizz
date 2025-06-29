import 'package:flutter/material.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F9FC),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'About Application',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildSection(
            '1. Introduction',
            'Jobizz is a modern job search application designed to streamline the hiring process by connecting job seekers and employers in a flexible, easy and smart way.',
            'https://img.freepik.com/free-vector/job-hunting-concept-illustration_114360-476.jpg',
          ),
          _buildSection(
            '2. Purpose of the Application',
            'The main goal of Jobizz is to provide an integrated platform that helps individuals find suitable jobs and assists companies in hiring the best talents using intelligent tools.',
            'https://img.freepik.com/free-vector/job-interview-concept-illustration_114360-7462.jpg',
          ),
          _buildNavFlowSection(),
          _buildSection(
            '4. Extra Features',
            '✔ Sign in with Google\n✔ Create and manage multiple job profiles\n✔ AI Chatbot for smart job suggestions\n✔ Save jobs and apply later\n✔ Instant feedback notifications\n✔ Dark mode support (optional)',
            'https://img.freepik.com/free-vector/app-development-concept-illustration_114360-5163.jpg',
          ),
          _buildSection(
            '5. Design Tools Used',
            '- Flutter Framework\n- Clean Architecture\n- BLoC State Management\n- Google Fonts\n- Custom Color Palette\n- ScreenUtil for responsive design',
            'https://img.freepik.com/free-vector/website-setup-concept-illustration_114360-3876.jpg',
          ),
          _buildSection(
            '6. Conclusion',
            'Jobizz is more than just a job search app; it’s a smart assistant that helps users find the right opportunities with less effort and more confidence. We aim to empower job seekers and businesses alike through a seamless and intuitive experience.',
            'https://img.freepik.com/free-vector/successful-business-partnership-concept_74855-7345.jpg',
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String text, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavFlowSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: const Color(0xFF5B6CFF),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '3. Navigation Flow',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Onboarding\nAuthentication (Login, Register, Forget Password)\nHome (Featured & Popular Jobs)\nJob Details\nSearch & Filters\nSaved Jobs\nProfile Management\nSettings\nChatbot (AI Assistant)',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://img.freepik.com/free-vector/successful-business-partnership-concept_74855-7345.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
