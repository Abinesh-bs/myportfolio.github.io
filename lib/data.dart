import 'package:flutter/material.dart';

/// ============================================================
///  EDIT ONLY THIS FILE TO UPDATE YOUR PORTFOLIO CONTENT
/// ============================================================

class Profile {
  static const name = 'Abinesh BS';
  static const roles = [
    'Flutter Developer',
    'iOS Developer (Xcode)',
    'Supabase Backend Developer',
    'App Store & Play Store Publisher'
  ];
  static const tagline =
      'I design and ship fast, beautiful mobile apps that real users love.';
  static const about =
      'Mobile developer working with Flutter, native iOS (Xcode) and Supabase. I have taken '
      'apps from idea to production on both the App Store and Google Play: education, social, '
      'marketing, safety and on-demand mobility platforms.';
  static const email = 'your@email.com'; // TODO: change
  static const linkedin = 'https://linkedin.com/in/your-id'; // TODO: change
  static const github = 'https://github.com/abinesh-bs';
  static const stats = [
    ['2+', 'Years Experience'],
    ['10+', 'Apps Published'],
    ['iOS + Android', 'Store Deployment'],
  ];
}

class SkillGroup {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> items;
  const SkillGroup(this.title, this.icon, this.color, this.items);
}

/// Add/edit skills here. Add a new SkillGroup(...) to create a new card.
const skillGroups = [
  SkillGroup(
      'Mobile Development',
      Icons.phone_iphone_rounded,
      Color(0xFFFF8A1F),
      ['Flutter', 'Dart', 'Xcode / iOS', 'App Store & Play Store']),
  SkillGroup('UI & UX', Icons.brush_rounded, Color(0xFFD946EF),
      ['UI & UX Design', 'Responsive UI', 'Animations', 'Custom Widgets']),
  SkillGroup('Backend & Data', Icons.storage_rounded, Color(0xFFFF4D6D),
      ['Supabase', 'Firebase', 'GraphQL', 'REST API']),
  SkillGroup('State Management', Icons.account_tree_rounded, Color(0xFFF59E0B),
      ['GetX', 'Bloc', 'Riverpod', 'Provider']),
  SkillGroup('Payments & Maps', Icons.payments_rounded, Color(0xFFE11D74), [
    'Stripe',
    'Razorpay',
    'Flutterwave',
    'Google Maps',
    'Push Notifications'
  ]),
  SkillGroup('Release & Tools', Icons.rocket_launch_rounded, Color(0xFFEA580C),
      ['App Store Connect', 'Play Console', 'TestFlight', 'Git / GitHub']),
];

class Job {
  final String role, company, period;
  final List<String> points;
  const Job(this.role, this.company, this.period, this.points);
}

/// Add a new job: copy one Job(...) line. Newest first.
const jobs = [
  Job('Flutter & iOS Developer', 'Code Regime Technologies',
      'Feb 2025 – Present', [
    'iOS app development using Xcode.',
    'Deployed apps to the App Store and Google Play Store.',
    'Built backends with Supabase and Flutter.',
    'State management with GetX and Bloc.',
    'Delivered 10+ production apps across education, social, marketing, safety and cab booking.',
  ]),
  Job('Flutter Developer', 'Cron24 Technologies', 'Nov 2023 – Jan 2025', [
    'Designed and built polished mobile UI with a focus on UI & UX.',
    'Integrated GraphQL and REST APIs, and Firebase services.',
    'Implemented Google Maps and online payments with Stripe and Razorpay.',
    'Managed app state using Provider and Riverpod.',
  ]),
];

class Project {
  final String title, category, desc;
  final List<String> stack;
  final String path;
  final Color accent;
  final String? play, ios;
  const Project(
      this.title, this.category, this.desc, this.stack, this.path, this.accent,
      {this.play, this.ios});
}

/// Add a new project: copy one Project(...) block. Omit play:/ios: if no link.
const projects = [
  Project(
      'Kemetic App',
      'Education',
      'Esoteric courses from Kemetic University: ancient Egyptian yoga, hieroglyphs, meditation and spirituality for modern living.',
      ['Flutter', 'Supabase', 'Video Courses'],
      "kemetic.jpeg",
      Color(0xFFF59E0B),
      play:
          'https://play.google.com/store/apps/details?id=com.app.kemeticapp&hl=en_IN',
      ios: 'https://apps.apple.com/in/app/kemetic-app/id6479200304'),
  Project(
      'Well Check',
      'Safety',
      'Fast, simple and intuitive check-in app that keeps families connected, with peace of mind a tap away.',
      ['Flutter', 'Notifications', 'Supabase'],
      "wellcheck.png",
      Color(0xFF10B981),
      play:
          'https://play.google.com/store/apps/details?id=com.anwiik.well_check_v3&hl=en_IN',
      ios:
          'https://apps.apple.com/in/app/well-check-family-safety/id6764582880'),
  Project(
      'SocialPour',
      'Marketing',
      'AI-powered marketing platform for restaurants and bars: captions, flyers, social scheduling, email and SMS campaigns, and team management.',
      ['Flutter', 'Supabase', 'AI'],
      "social_pour.png",
      Color(0xFFEC4899),
      play:
          'https://play.google.com/store/apps/details?id=com.app.socialpour&hl=en_IN'),
  Project(
      'Tagnool',
      'Social',
      'Privacy-first social app to share, chat and discover, built for calm connection with no engagement traps or targeted ads.',
      ['Flutter', 'Realtime Chat', 'Privacy'],
      "tagnool.webp",
      Color(0xFF06B6D4),
      play:
          'https://play.google.com/store/apps/details?id=com.tagnool&hl=en_IN',
      ios: 'https://apps.apple.com/in/app/tagnool/id6797325268'),
  Project(
      'Guls',
      'Mobility',
      'Roadside assistance in Qatar: towing, flat tire, battery charge and fuel delivery with 24/7 on-demand service.',
      ['Flutter', 'Google Maps', 'Live Tracking'],
      "guls.webp",
      Color(0xFFEF4444),
      play:
          'https://play.google.com/store/apps/details?id=com.guls.passenger&hl=en_IN',
      ios:
          'https://apps.apple.com/in/app/guls-%D9%82%D9%84%D8%B5/id1396948609'),
  Project(
      'Riders – Chalo Bayya',
      'Mobility',
      'Uber-clone cab booking with added parcel delivery. Live tracking, fare estimates and trip history.',
      ['Flutter', 'Google Maps', 'Delivery'],
      "rider_chalo_bhayya.webp",
      Color(0xFF8B5CF6),
      play:
          'https://play.google.com/store/apps/details?id=com.ridersapp.user&hl=en_IN',
      ios: 'https://apps.apple.com/in/app/riders-chalo-bayya/id6737753615'),
  Project(
      'Bestva',
      'Mobility',
      'Cab booking and parcel delivery user app built on an Uber-style ride-hailing flow.',
      ['Flutter', 'Google Maps', 'Delivery'],
      "bestva.webp",
      Color(0xFF3B82F6),
      play:
          'https://play.google.com/store/apps/details?id=com.bestva_user&hl=en_IN'),
  Project(
      'Pushpa Cabs',
      'Mobility',
      'Cab user app, an Uber-clone passenger experience with booking, live ride tracking and fare details.',
      ['Flutter', 'Google Maps'],
      "pushpa_riders.webp",
      Color(0xFFF97316),
      play:
          'https://play.google.com/store/apps/details?id=com.pushpaapp.user&hl=en_IN'),
  Project(
      'Pink Driver',
      'Mobility',
      'Cab user app (Uber clone) with smooth booking, real-time tracking and a bilingual interface.',
      ['Flutter', 'Google Maps'],
      "pink_driver.webp",
      Color(0xFFF472B6),
      play:
          'https://play.google.com/store/apps/details?id=com.pinkdriver.passenger&hl=en_IN',
      ios:
          'https://apps.apple.com/in/app/pink-driver-%D8%A8%D9%8A%D9%86%D9%83-%D8%AF%D8%B1%D8%A7%D9%8A%D9%81%D8%B1/id1456617792'),
];
