import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ---------- PALETTE: warm "sunset" (amber -> coral -> magenta) on black & white ----------
// To try another look, swap the colours below (examples at the bottom of this block).
const kInk = Color(0xFF0B0809);      // dark section background (warm black)
const kPaper = Color(0xFFFBF7F4);    // light section background (warm white)
const kHot = Color(0xFFFF4D6D), kWarm = Color(0xFFFFB347);                          // accents
const kGrad = LinearGradient(colors: [Color(0xFFFFB347), Color(0xFFFF5E7E), Color(0xFFD946EF)]);      // on dark
const kGradLight = LinearGradient(colors: [Color(0xFFEA580C), Color(0xFFE11D48), Color(0xFF9333EA)]); // text on light
const kBtn = LinearGradient(colors: [Color(0xFFFF8A1F), Color(0xFFE11D74)]);                          // buttons
// ALTERNATIVES  (replace kHot/kWarm/kGrad/kGradLight/kBtn):
//  Royal gold : 0xFFF5D08A, 0xFFC9962B, 0xFF8A5A00   (black + gold)
//  Ocean glow : 0xFF38BDF8, 0xFF6366F1, 0xFFEC4899   (sky -> indigo -> pink)
//  Peach soft : 0xFFFFD6A5, 0xFFFF9AA2, 0xFFB5A7FF   (pastel)

bool isDark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;
Color fg(BuildContext c) => isDark(c) ? Colors.white : const Color(0xFF0B0B12);
Color mut(BuildContext c) => fg(c).withOpacity(.62);

void open(String? u) {
  if (u != null) launchUrl(Uri.parse(u), webOnlyWindowName: '_blank');
}

class GText extends StatelessWidget {
  final String t; final double size; final FontWeight w;
  const GText(this.t, {super.key, this.size = 20, this.w = FontWeight.w700});
  @override
  Widget build(BuildContext c) => ShaderMask(
        shaderCallback: (r) => (isDark(c) ? kGrad : kGradLight).createShader(r),
        child: Text(t, style: size >= 34
            ? GoogleFonts.playfairDisplay(fontSize: size, fontWeight: w, color: Colors.white, height: 1.1)
            : TextStyle(fontSize: size, fontWeight: w, color: Colors.white, height: 1.1)),
      );
}

/// Fade + slide up when scrolled into view.
class Reveal extends StatefulWidget {
  final Widget child; final int delay;
  const Reveal({super.key, required this.child, this.delay = 0});
  @override State<Reveal> createState() => _RevealState();
}
class _RevealState extends State<Reveal> {
  bool shown = false;
  @override
  Widget build(BuildContext c) => VisibilityDetector(
        key: ObjectKey(this),
        onVisibilityChanged: (i) {
          if (!shown && i.visibleFraction > .08) {
            Future.delayed(Duration(milliseconds: widget.delay), () { if (mounted) setState(() => shown = true); });
          }
        },
        child: AnimatedSlide(
          offset: shown ? Offset.zero : const Offset(0, .1),
          duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic,
          child: AnimatedOpacity(opacity: shown ? 1 : 0, duration: const Duration(milliseconds: 800), child: widget.child),
        ),
      );
}

class Floating extends StatefulWidget {
  final Widget child; final double amount; final int seconds;
  const Floating({super.key, required this.child, this.amount = 12, this.seconds = 4});
  @override State<Floating> createState() => _FloatingState();
}
class _FloatingState extends State<Floating> with SingleTickerProviderStateMixin {
  late final c = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..repeat(reverse: true);
  @override void dispose() { c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext ctx) => AnimatedBuilder(
      animation: c,
      builder: (_, ch) => Transform.translate(offset: Offset(0, math.sin(c.value * math.pi) * widget.amount), child: ch),
      child: widget.child);
}

/// Animated colour glow for dark sections.
class Glow extends StatefulWidget {
  final Color a, b;
  const Glow({super.key, this.a = kHot, this.b = kWarm});
  @override State<Glow> createState() => _GlowState();
}
class _GlowState extends State<Glow> with SingleTickerProviderStateMixin {
  late final c = AnimationController(vsync: this, duration: const Duration(seconds: 16))..repeat();
  @override void dispose() { c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext ctx) => LayoutBuilder(builder: (_, k) => AnimatedBuilder(animation: c, builder: (_, __) {
        final t = c.value * 2 * math.pi;
        Widget orb(Color col, double x, double y, double s) => Positioned(
            left: x + math.sin(t) * 60, top: y + math.cos(t) * 60,
            child: Container(width: s, height: s, decoration: BoxDecoration(shape: BoxShape.circle,
                gradient: RadialGradient(colors: [col.withOpacity(.30), Colors.transparent]))));
        return Stack(children: [orb(widget.a, -120, -100, 560), orb(widget.b, k.maxWidth * .6, k.maxHeight * .3, 460)]);
      }));
}

/// Card: glass on dark sections, white card on light sections. Lifts on hover.
class Glass extends StatefulWidget {
  final Widget child; final EdgeInsets pad; final Color glow;
  const Glass({super.key, required this.child, this.pad = const EdgeInsets.all(24), this.glow = kHot});
  @override State<Glass> createState() => _GlassState();
}
class _GlassState extends State<Glass> {
  bool h = false;
  @override
  Widget build(BuildContext c) {
    final d = isDark(c);
    return MouseRegion(
      onEnter: (_) => setState(() => h = true), onExit: (_) => setState(() => h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, h ? -8 : 0, 0), padding: widget.pad,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: d ? null : Colors.white,
          gradient: d ? LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
              colors: [Colors.white.withOpacity(h ? .10 : .06), Colors.white.withOpacity(.02)]) : null,
          border: Border.all(color: h ? widget.glow.withOpacity(.9) : (d ? Colors.white12 : Colors.black12)),
          boxShadow: [BoxShadow(color: (h ? widget.glow : Colors.black).withOpacity(h ? .30 : (d ? .3 : .06)), blurRadius: h ? 36 : 20, offset: const Offset(0, 8))],
        ),
        child: widget.child,
      ),
    );
  }
}

class GButton extends StatelessWidget {
  final String label; final IconData? icon; final VoidCallback onTap; final bool filled;
  const GButton(this.label, this.onTap, {super.key, this.icon, this.filled = true});
  @override
  Widget build(BuildContext c) {
    final col = filled ? Colors.white : fg(c);
    return InkWell(
      borderRadius: BorderRadius.circular(30), onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          gradient: filled ? kBtn : null, borderRadius: BorderRadius.circular(30),
          border: filled ? null : Border.all(color: fg(c).withOpacity(.35)),
          boxShadow: filled ? [BoxShadow(color: kHot.withOpacity(.4), blurRadius: 22)] : null),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 18, color: col), const SizedBox(width: 8)],
          Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: col)),
        ]),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String t; final bool active; final VoidCallback? onTap;
  const Tag(this.t, {super.key, this.active = false, this.onTap});
  @override
  Widget build(BuildContext c) => InkWell(
        borderRadius: BorderRadius.circular(20), onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), gradient: active ? kBtn : null,
              color: active ? null : fg(c).withOpacity(.07),
              border: Border.all(color: active ? Colors.transparent : fg(c).withOpacity(.12))),
          child: Text(t, style: TextStyle(fontSize: 12.5, color: active ? Colors.white : mut(c), fontWeight: active ? FontWeight.w600 : FontWeight.w500)),
        ),
      );
}

class SectionTitle extends StatelessWidget {
  final String small, big;
  const SectionTitle(this.small, this.big, {super.key});
  @override
  Widget build(BuildContext c) => Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GText(small.toUpperCase(), size: 13),
          const SizedBox(height: 8),
          Text(big, style: GoogleFonts.playfairDisplay(fontSize: 38, fontWeight: FontWeight.w700, color: fg(c))),
        ]),
      );
}

class RoleSwitcher extends StatefulWidget {
  final List<String> roles; final double size;
  const RoleSwitcher(this.roles, {super.key, this.size = 24});
  @override State<RoleSwitcher> createState() => _RoleSwitcherState();
}
class _RoleSwitcherState extends State<RoleSwitcher> {
  int i = 0; Timer? t;
  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(seconds: 3), (_) { if (mounted) setState(() => i = (i + 1) % widget.roles.length); });
  }
  @override void dispose() { t?.cancel(); super.dispose(); }
  @override
  Widget build(BuildContext c) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (ch, a) => FadeTransition(opacity: a,
            child: SlideTransition(position: Tween(begin: const Offset(0, .5), end: Offset.zero).animate(a), child: ch)),
        child: Align(key: ValueKey(i), alignment: Alignment.centerLeft, child: GText(widget.roles[i], size: widget.size)),
      );
}
