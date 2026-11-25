import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'widgets.dart';

void main() => runApp(const App());

ThemeData _theme(Brightness b) {
  final base = ThemeData(brightness: b);
  return base.copyWith(
      scaffoldBackgroundColor: kInk,
      textTheme: GoogleFonts.dmSansTextTheme(base.textTheme));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '${Profile.name} | Portfolio',
        theme: _theme(Brightness.dark),
        home: const Home(),
      );
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final keys = {
    for (final s in ['About', 'Skills', 'Experience', 'Projects', 'Contact'])
      s: GlobalKey()
  };
  String filter = 'All';

  void go(String s) => Scrollable.ensureVisible(keys[s]!.currentContext!,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubic);

  @override
  Widget build(BuildContext c) {
    final w = MediaQuery.of(c).size.width;
    final m = w < 800;
    final pad = m ? 20.0 : 48.0;

    // One section = one background. Alternates BLACK / WHITE as you scroll.
    Widget sec(String k,
        {required bool dark, required Widget child, bool glow = false}) {
      final b = dark ? Brightness.dark : Brightness.light;
      return Theme(
        data: _theme(b),
        child: Builder(
            builder: (ctx) => DefaultTextStyle(
                  style: GoogleFonts.dmSans(fontSize: 14, color: fg(ctx)),
                  child: Container(
                    key: keys[k],
                    width: double.infinity,
                    color: dark ? kInk : kPaper,
                    child: Stack(children: [
                      if (glow) const Positioned.fill(child: Glow()),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(
                            horizontal: pad, vertical: m ? 56 : 96),
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 2000),
                            child: child),
                      ),
                    ]),
                  ),
                )),
      );
    }

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
            child: Column(children: [
          sec('About', dark: true, glow: true, child: _hero(c, m)),
          sec('Skills', dark: false, child: _skills(m)),
          sec('Experience', dark: true, glow: true, child: _experience()),
          sec('Projects', dark: false, child: _projects(w, m)),
          sec('Contact', dark: true, glow: true, child: _contact(m)),
        ])),
        _nav(m, pad),
      ]),
    );
  }

  Widget _nav(bool m, double pad) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            decoration: BoxDecoration(
                color: kInk.withOpacity(.72),
                border:
                    const Border(bottom: BorderSide(color: Colors.white10))),
            padding: EdgeInsets.symmetric(horizontal: pad, vertical: 12),
            child: Row(children: [
              ShaderMask(
                  shaderCallback: (r) => kGrad.createShader(r),
                  child: const Text('AB.',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.white))),
              const Spacer(),
              if (!m) ...[
                for (final k in keys.keys)
                  TextButton(
                      onPressed: () => go(k),
                      child: Text(k,
                          style: const TextStyle(color: Colors.white70)))
              ] else
                PopupMenuButton<String>(
                    icon: const Icon(Icons.menu_rounded, color: Colors.white),
                    color: const Color(0xFF15151F),
                    onSelected: go,
                    itemBuilder: (_) => [
                          for (final k in keys.keys)
                            PopupMenuItem(
                                value: k,
                                child: Text(k,
                                    style:
                                        const TextStyle(color: Colors.white)))
                        ]),
            ]),
          ),
        )),
      );

  // ---------- HERO (dark) ----------
  Widget _hero(BuildContext c, bool m) {
    final text =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: m ? 40 : 60),
      Reveal(child: const Tag('👋  Open to new opportunities')),
      const SizedBox(height: 22),
      Reveal(
          delay: 120,
          child: Text("Hi, I'm",
              style: TextStyle(fontSize: m ? 20 : 26, color: mut(c)))),
      Reveal(
          delay: 220,
          child: GText(Profile.name, size: m ? 46 : 76, w: FontWeight.w900)),
      const SizedBox(height: 12),
      Reveal(
          delay: 320,
          child: SizedBox(
              height: 40,
              child: RoleSwitcher(Profile.roles, size: m ? 20 : 26))),
      const SizedBox(height: 14),
      Reveal(
          delay: 420,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text('${Profile.tagline}\n\n${Profile.about}',
                  style:
                      TextStyle(color: mut(c), height: 1.7, fontSize: 15.5)))),
      const SizedBox(height: 28),
      Reveal(
          delay: 520,
          child: Wrap(spacing: 14, runSpacing: 14, children: [
            GButton('View Projects', () => go('Projects'),
                icon: Icons.rocket_launch_rounded),
            GButton('Contact Me', () => go('Contact'),
                icon: Icons.mail_rounded, filled: false),
          ])),
      const SizedBox(height: 40),
      Reveal(
          delay: 620,
          child: Wrap(spacing: 14, runSpacing: 14, children: [
            for (final s in Profile.stats)
              SizedBox(
                  width: 165,
                  child: Glass(
                      pad: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GText(s[0], size: s[0].length > 4 ? 18 : 30),
                            const SizedBox(height: 6),
                            Text(s[1],
                                style: TextStyle(color: mut(c), fontSize: 12))
                          ]))),
          ])),
    ]);
    if (m) return text;
    return Row(children: [
      Expanded(flex: 6, child: text),
      Expanded(flex: 4, child: _heroArt())
    ]);
  }

  Widget _heroArt() {
    Widget tile(String t, String img, Color col,
            {double? left, double? right, required double top, int s = 4}) =>
        Positioned(
          left: left,
          right: right,
          top: top,
          child: Floating(
            seconds: s,
            child: Glass(
              glow: col,
              pad: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset('assets/project_logo/$img', width: 26, height: 26),
                const SizedBox(width: 10),
                Text(t, style: const TextStyle(fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
        );

    return Center(
      child: SizedBox(
        width: 420,
        height: 480,
        child: Stack(alignment: Alignment.center, children: [
          // centre circle
          Floating(
            amount: 8,
            seconds: 6,
            child: Container(
              width: 250,
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: kBtn,
                boxShadow: [
                  BoxShadow(
                      color: kHot.withOpacity(.55),
                      blurRadius: 80,
                      spreadRadius: 6)
                ],
              ),
              child: const Text('AB',
                  style: TextStyle(
                      fontSize: 84,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
            ),
          ),
          // zigzag: left, right, left, right, left
          tile('Flutter', 'flutter.png', kWarm, left: 0, top: 20, s: 4),
          tile('iOS · Xcode', 'xcode.webp', Colors.white,
              right: 0, top: 115, s: 5),
          tile('App Store', 'appstore.png', kHot, left: 0, top: 210, s: 6),
          tile('Supabase', 'supabase.png', kWarm, right: 0, top: 305, s: 5),
          tile('Play Store', 'playstore.png', kHot, left: 0, top: 400, s: 4),
        ]),
      ),
    );
  }

  // ---------- SKILLS (light) ----------
  Widget _skills(bool m) => Builder(
      builder: (c) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SectionTitle('Expertise', 'Skills & Tools'),
            LayoutBuilder(builder: (_, k) {
              final cols = k.maxWidth < 700 ? 1 : 2;
              final cw = (k.maxWidth - (cols - 1) * 20) / cols;
              return Wrap(spacing: 20, runSpacing: 20, children: [
                for (var i = 0; i < skillGroups.length; i++)
                  SizedBox(
                      width: cw,
                      child: Reveal(
                          delay: (i % cols) * 120,
                          child: Glass(
                            glow: skillGroups[i].color,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: skillGroups[i]
                                                .color
                                                .withOpacity(.18)),
                                        child: Icon(skillGroups[i].icon,
                                            color: skillGroups[i].color)),
                                    const SizedBox(width: 14),
                                    Text(skillGroups[i].title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  ]),
                                  const SizedBox(height: 18),
                                  Wrap(spacing: 10, runSpacing: 10, children: [
                                    for (final s in skillGroups[i].items) Tag(s)
                                  ]),
                                ]),
                          ))),
              ]);
            }),
          ]));

  // ---------- EXPERIENCE (dark) ----------
  Widget _experience() => Builder(
      builder: (c) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SectionTitle('Journey', 'Work Experience'),
            for (final j in jobs)
              Reveal(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                          width: double.infinity,
                          child: Glass(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                      spacing: 12,
                                      runSpacing: 8,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(j.role,
                                            style: const TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700)),
                                        Tag(j.period, active: true)
                                      ]),
                                  const SizedBox(height: 6),
                                  GText(j.company, size: 16),
                                  const SizedBox(height: 14),
                                  for (final p in j.points)
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4),
                                                  child: Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      size: 15,
                                                      color: kWarm)),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                  child: Text(p,
                                                      style: TextStyle(
                                                          color: mut(c),
                                                          height: 1.5)))
                                            ])),
                                ]),
                          )))),
          ]));

  // ---------- PROJECTS (light) ----------
  Widget _projects(double w, bool m) {
    final cats = [
      'All',
      ...{for (final p in projects) p.category}
    ];
    final list =
        projects.where((p) => filter == 'All' || p.category == filter).toList();
    final cols = w < 700 ? 1 : (w < 1100 ? 2 : 3);
    final inner = math.min(w, 1200) - (m ? 40 : 96);
    final cw = (inner - (cols - 1) * 20) / cols;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionTitle('Portfolio', 'Projects I Built'),
      Wrap(spacing: 10, runSpacing: 10, children: [
        for (final k in cats)
          Tag(k, active: filter == k, onTap: () => setState(() => filter = k))
      ]),
      const SizedBox(height: 28),
      Wrap(spacing: 20, runSpacing: 20, children: [
        for (var i = 0; i < list.length; i++)
          SizedBox(
              key: ValueKey('${list[i].title}$filter'),
              width: cw,
              child: Reveal(delay: (i % cols) * 120, child: _card(list[i]))),
      ]),
    ]);
  }

  Widget _card(Project p) => Builder(
      builder: (c) => SizedBox(
          height: 340,
          child: Glass(
              glow: p.accent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            // gradient:
                            //     LinearGradient(colors: [p.accent, kHot]),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: p.accent.withOpacity(.4),
                            //       blurRadius: 16)
                            // ])
                          ),
                          child: Image.asset(
                            "assets/project_logo/${p.path}",
                            fit: BoxFit.cover,
                          )),
                      const Spacer(),
                      Tag(p.category),
                    ]),
                    const SizedBox(height: 18),
                    Text(p.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Expanded(
                        child: Text(p.desc,
                            style: TextStyle(
                                color: mut(c), height: 1.6, fontSize: 13.5),
                            overflow: TextOverflow.fade)),
                    Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [for (final s in p.stack) Tag(s)]),
                    const SizedBox(height: 14),
                    Row(children: [
                      if (p.play != null)
                        Expanded(
                            child:
                                _store(c, 'Play Store', Icons.android, p.play)),
                      if (p.play != null && p.ios != null)
                        const SizedBox(width: 10),
                      if (p.ios != null)
                        Expanded(
                            child: _store(c, 'App Store', Icons.apple, p.ios)),
                    ]),
                  ]))));

  Widget _store(BuildContext c, String l, IconData i, String? u) =>
      OutlinedButton.icon(
          onPressed: () => open(u),
          icon: Icon(i, size: 18),
          label: Text(l, style: const TextStyle(fontSize: 12.5)),
          style: OutlinedButton.styleFrom(
              foregroundColor: fg(c),
              side: BorderSide(color: fg(c).withOpacity(.25)),
              shape: const StadiumBorder()));

  // ---------- CONTACT (dark) ----------
  Widget _contact(bool m) => Builder(
      builder: (c) => Column(children: [
            Reveal(
                child: SizedBox(
                    width: double.infinity,
                    child: Glass(
                        pad: EdgeInsets.all(m ? 28 : 56),
                        child: Column(children: [
                          GText("Let's build something amazing",
                              size: m ? 28 : 44, w: FontWeight.w800),
                          const SizedBox(height: 14),
                          Text(
                              'Have a project or opportunity in mind? Reach out, I would love to hear from you.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: mut(c))),
                          const SizedBox(height: 28),
                          Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 14,
                              runSpacing: 14,
                              children: [
                                GButton('Email',
                                    () => open('mailto:${Profile.email}'),
                                    icon: Icons.mail_rounded),
                                GButton(
                                    'LinkedIn', () => open(Profile.linkedin),
                                    icon: Icons.work_rounded, filled: false),
                                GButton('GitHub', () => open(Profile.github),
                                    icon: Icons.code_rounded, filled: false),
                              ]),
                        ])))),
            const SizedBox(height: 40),
            Text('© 2026 ${Profile.name} · Built with Flutter 💙',
                style: TextStyle(color: mut(c).withOpacity(.5))),
          ]));
}
