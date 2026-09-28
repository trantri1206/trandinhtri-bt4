import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Tris Bơ | Profile',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0284C7),
        surface: const Color(0xFFF8FAFC),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    ),
    home: const ProfilePage(),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const ink = Color(0xFF0F172A);
  static const muted = Color(0xFF64748B);

  void _copy(BuildContext context, String value) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Copied to clipboard'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              key: const ValueKey('profile-frame'),
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xFFCBD5E1), width: 2),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(context),
                    const SizedBox(height: 24),
                    _identity(),
                    const SizedBox(height: 24),
                    _stats(),
                    const SizedBox(height: 25),
                    _about(),
                    const SizedBox(height: 21),
                    _skills(),
                    const SizedBox(height: 23),
                    _projects(),
                    const SizedBox(height: 31),
                    _contacts(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _header(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _HeaderButton(
        Icons.chevron_left_rounded,
        'Go back',
        () => Navigator.maybePop(context),
      ),
      const Text(
        'Profile',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F172A),
        ),
      ),
      _HeaderButton(
        Icons.share_outlined,
        'Share profile',
        () => _copy(context, 'Tris Bơ — Lead Mobile Engineer'),
      ),
    ],
  );

  Widget _identity() => Column(
    children: [
      Center(
        child: SizedBox(
          width: 140,
          height: 140,
          key: const ValueKey('profile-avatar'),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFB088),
                      Color(0xFFFF8080),
                      Color(0xFFFFD166),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    key: const ValueKey('profile-avatar-clip'),
                    child: Image.asset(
                      'images/z7280183976295_740b340b375a3cebde732a01a7e526cd.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const ColoredBox(
                            color: Color(0xFFE2E7ED),
                            child: Icon(Icons.person, size: 76, color: muted),
                          ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.check, size: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Tris Bơ',
        style: TextStyle(
          fontSize: 24,
          height: 1.2,
          fontWeight: FontWeight.w800,
          color: Color(0xFF0F172A),
        ),
      ),
      const SizedBox(height: 5),
      const Text(
        'Lead Mobile Engineer',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF64748B),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: Color(0xFF475569),
            ),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                'TP Hồ Chí Minh, Việt Nam',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _stats() => Container(
    height: 78,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0x140F172A),
          blurRadius: 18,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: const Row(
      children: [
        Expanded(child: _Stat('148', 'Projects')),
        _StatDivider(),
        Expanded(child: _Stat('9 Yrs', 'Experience')),
        _StatDivider(),
        Expanded(child: _Stat('4.9 ★', 'Rating', highlighted: true)),
      ],
    ),
  );

  Widget _about() => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionTitle('About Me'),
      SizedBox(height: 7),
      Text(
        'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant',
        style: TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF475569)),
      ),
    ],
  );

  Widget _skills() => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionTitle('Skills & Expertise'),
      SizedBox(height: 9),
      Wrap(
        spacing: 8,
        runSpacing: 9,
        children: [
          _SkillChip(
            'Flutter',
            Icons.construction,
            Color(0xFFE1F4FF),
            Color(0xFF0575B8),
          ),
          _SkillChip('Dart', Icons.code, Color(0xFFE0F9EA), Color(0xFF148246)),
          _SkillChip(
            'Clean Arch',
            Icons.layers_outlined,
            Color(0xFFFFE5E8),
            Color(0xFFD82443),
          ),
          _SkillChip(
            'UI/UX',
            Icons.near_me_outlined,
            Color(0xFFF4E8FF),
            Color(0xFF8B28D5),
          ),
          _SkillChip(
            'Firebase',
            Icons.local_fire_department_outlined,
            Color(0xFFFFF2C9),
            Color(0xFFB65B00),
          ),
        ],
      ),
    ],
  );

  Widget _projects() => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionTitle('Featured Projects'),
      SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: _ProjectCard(
              title: 'E-Shop Flutter',
              subtitle: 'Mobile App • 2026',
              imageUrl: 'https://images.unsplash.com/photo-1578916171728-46686eac8d58?auto=format&fit=crop&w=520&h=300&q=85',
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _ProjectCard(
              title: 'Crypto Vault',
              subtitle: 'Finance • Clean Arch',
            ),
          ),
        ],
      ),
    ],
  );

  Widget _contacts(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFDCE5EF)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x120F172A),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        const _ContactRow(
          Icons.alternate_email,
          'Contact Information',
          heading: true,
          divider: true,
        ),
        _ContactRow(
          Icons.mail_outline,
          'trandinhtri852@gmail.com',
          divider: true,
          onTap: () => _copy(context, 'trandinhtri852@gmail.com'),
        ),
        _ContactRow(
          Icons.call_outlined,
          '0886250112',
          onTap: () => _copy(context, '0886250112'),
        ),
      ],
    ),
  );
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton(this.icon, this.label, this.onPressed);
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 42,
    height: 42,
    child: IconButton(
      onPressed: onPressed,
      tooltip: label,
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 21, color: const Color(0xFF26364D)),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat(this.value, this.label, {this.highlighted = false});
  final String value;
  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 21,
          height: 1.1,
          fontWeight: FontWeight.w700,
          color: highlighted
              ? const Color(0xFFE7A900)
              : const Color(0xFF0F172A),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(fontSize: 12, color: Color(0xFF8A9BB5)),
      ),
    ],
  );
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 28, color: const Color(0xFFE2E8F0));
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: ProfilePage.ink,
    ),
  );
}

class _SkillChip extends StatelessWidget {
  const _SkillChip(this.label, this.icon, this.color, this.foreground);
  final String label;
  final IconData icon;
  final Color color;
  final Color foreground;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: foreground),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: foreground,
          ),
        ),
      ],
    ),
  );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    this.imageUrl = '',
  });
  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => SizedBox(
    key: ValueKey('project-$title'),
    height: 145,
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE5EF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x071D3553),
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 85, width: double.infinity, child: _image()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: ProfilePage.ink,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: ProfilePage.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _image() {
    if (imageUrl.isEmpty) return const _CryptoArtwork();
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const ColoredBox(
        color: Color(0xFFE5E9ED),
        child: Center(
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 38,
            color: Color(0xFF758397),
          ),
        ),
      ),
    );
  }
}

class _CryptoArtwork extends StatelessWidget {
  const _CryptoArtwork();

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFB452),
              Color(0xFFFF6FAE),
              Color(0xFF8B27D8),
              Color(0xFF4122A9),
            ],
          ),
        ),
      ),
      CustomPaint(painter: _WavePainter()),
    ],
  );
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blue = Paint()..color = const Color(0xFF08BCD3);
    final violet = Paint()..color = const Color(0xA85B13D1);
    final blueWave = Path()
      ..moveTo(0, size.height * .47)
      ..cubicTo(
        size.width * .22,
        size.height * .24,
        size.width * .38,
        size.height * .78,
        size.width * .62,
        size.height * .53,
      )
      ..cubicTo(
        size.width * .78,
        size.height * .36,
        size.width * .83,
        size.height * .56,
        size.width,
        size.height * .43,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    final violetWave = Path()
      ..moveTo(0, size.height * .7)
      ..cubicTo(
        size.width * .32,
        size.height * .37,
        size.width * .51,
        size.height * .36,
        size.width,
        size.height * .72,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(violetWave, violet);
    canvas.drawPath(blueWave, blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ContactRow extends StatelessWidget {
  const _ContactRow(
    this.icon,
    this.label, {
    this.heading = false,
    this.divider = false,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final bool heading;
  final bool divider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: heading
        ? const BorderRadius.vertical(top: Radius.circular(21))
        : null,
    child: Container(
      constraints: const BoxConstraints(minHeight: 64),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: divider
            ? const Border(bottom: BorderSide(color: Color(0xFFEDF1F5)))
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 19,
              color: heading ? ProfilePage.ink : ProfilePage.muted,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: heading ? FontWeight.w700 : FontWeight.w500,
                color: heading ? ProfilePage.ink : const Color(0xFF33435D),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 22,
            color: Color(0xFFC7D4E3),
          ),
        ],
      ),
    ),
  );
}
