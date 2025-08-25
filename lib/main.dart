import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const AikyamApp());
}

class AikyamApp extends StatelessWidget {
  const AikyamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aikyam Unity Foundation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  String currentPage = "About";

  // Pages map
  final Map<String, Widget> pages = {
    "Home": const HomePage(),
    "About": const AboutPage(),
    "Events": const EventsPage(),
    "Gallery": const GalleryPage(),
    "Contact": const ContactPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF442B04),
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 40,
            ),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                "ऐक्यम युनिटी फाउंडेशन",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
                overflow:
                    TextOverflow.ellipsis, // prevent overflow on small screens
              ),
            ),
          ],
        ),
        actions: MediaQuery.of(context).size.width > 700
            ? [
                // ✅ Show menu only on desktop/tablet
                for (String page in pages.keys)
                  TextButton(
                    onPressed: () => setState(() => currentPage = page),
                    child: Text(
                      page,
                      style: TextStyle(
                        color: currentPage == page
                            ? const Color.fromARGB(255, 246, 246, 103)
                            : Colors.white,
                        fontWeight: currentPage == page
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
              ]
            : null, // ✅ Hide actions on mobile
      ),
      drawer: MediaQuery.of(context).size.width <= 700
          ? Drawer(
              // ✅ Show drawer only on mobile
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF442B04)),
                    child: Text(
                      "ऐक्यम युनिटी फाउंडेशन",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  for (String page in pages.keys)
                    ListTile(
                      title: Text(page),
                      selected: currentPage == page,
                      onTap: () {
                        setState(() => currentPage = page);
                        Navigator.pop(context); // close drawer
                      },
                    ),
                ],
              ),
            )
          : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentPage],
      ),
    );
  }
}

//
// ==================== Pages ====================
//

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔹 Background Image with Overlay
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/aikyam_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.4), // dark overlay for contrast
        ),

        // 🔹 Animated Content
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 200),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fade + Slide animation for heading
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, (1 - value) * 50),
                        child: child,
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                      ),
                      children: [
                        TextSpan(
                          text: "Together ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: "We ",
                          style: TextStyle(color: Colors.orange),
                        ),
                        TextSpan(
                          text: "Are ",
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(
                          text: "One",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Subtitle fade-in
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    return Opacity(opacity: value, child: child);
                  },
                  child: const Text(
                    "Aikyam Unity Foundation",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Call to Action Button
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 4),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                        ),
                        onPressed: () {
                          // Example: Navigate to About Page
                          // Navigator.pushNamed(context, '/about');
                        },
                        child: const Text(
                          "Join Us",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0E0F12) : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- HERO ----------
            _HeroSection(),

            // ---------- OUR STORY ----------
            const _OurStory(),

            // ---------- CORE VALUES ----------
            const _CoreValues(),

            // ---------- IMPACT STATS ----------
            const _ImpactStats(),

            // ---------- CTA ----------
            const _CtaSection(),
          ],
        ),
      ),
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {"title": "Swachh Bharat Abhiyan", "image": "https://picsum.photos/400"},
      {"title": "Orphanage Visit", "image": "https://picsum.photos/401"},
      {
        "title": "Clothing Donation Drive",
        "image": "https://picsum.photos/402"
      },
    ];

    // Responsive columns
    int crossAxisCount = 3;
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      crossAxisCount = 1; // Mobile
    } else if (width < 900) {
      crossAxisCount = 2; // Tablet
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Clicked: ${event["title"]}")),
                );
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // Event Image with hover animation
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/bg1.jpg',
                        fit: BoxFit.cover,
                      ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                            begin: const Offset(1, 1),
                            end: const Offset(1.05, 1.05),
                            duration: 4.seconds,
                            curve: Curves.easeInOut,
                          ),
                    ),

                    // Title Overlay
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          event["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  // Scroll animation
                  .animate()
                  .fadeIn(duration: 600.ms, delay: (index * 200).ms)
                  .slideY(begin: 0.2, end: 0),
            ),
          );
        },
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final images = List.generate(9, (i) => "https://picsum.photos/40$i");

    // Responsive columns
    int crossAxisCount = 4;
    double width = MediaQuery.of(context).size.width;
    if (width < 600)
      crossAxisCount = 2; // Mobile
    else if (width < 900) crossAxisCount = 3; // Tablet

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/bg2.png', fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(24),
        child: const Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("📧 Email: aikyamunity@gmail.com",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("📱 Instagram: @aikyamunityfoundation",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("📞 Phone: +91 99999 99999", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background image (can be your team picture)
        SizedBox(
          height: size.height * 0.55,
          width: double.infinity,
          child: Image.asset(
            'assets/images/aikyam_bg.jpg',
            fit: BoxFit.cover,
          ),
        ).animate().fadeIn(duration: 800.ms).scale(
            begin: const Offset(1.02, 1.02),
            end: const Offset(1, 1),
            duration: 2.seconds),

        // Overlay gradient for readability
        Container(
          height: size.height * 0.55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.55),
                Colors.black.withOpacity(0.15)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),

        // Text content
        SizedBox(
          height: size.height * 0.55,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "About Aikyam Unity Foundation",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 12),
                  Text(
                    "Together We Are One — building unity, compassion, and real impact.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white.withOpacity(0.92),
                        ),
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ===================== OUR STORY =====================
class _OurStory extends StatelessWidget {
  const _OurStory();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final isWide = c.maxWidth > 900;

      final image = ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/bg1.jpg',
          height: 360,
          width: isWide ? 520 : double.infinity,
          fit: BoxFit.cover,
        ),
      ).animate().fadeIn(duration: 700.ms).slideX(begin: -0.1, end: 0);

      final text = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Column(
          crossAxisAlignment:
              isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Text(
              "Our Story",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Aikyam Unity Foundation is a youth-driven initiative started to bring people together for positive social change. "
              "We conduct cleanliness drives, visits to orphanages, donation campaigns, and awareness programs — all powered by volunteers.",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5),
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Our mission is simple: unite hearts, act with compassion, and create visible impact in our communities.",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5),
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
          ],
        ).animate().fadeIn(duration: 700.ms).slideX(begin: 0.1, end: 0),
      );

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: isWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      image,
                      const SizedBox(width: 32),
                      Expanded(child: text),
                    ],
                  )
                : Column(
                    children: [
                      image,
                      const SizedBox(height: 20),
                      text,
                    ],
                  ),
          ),
        ),
      );
    });
  }
}

// ===================== CORE VALUES =====================
class _CoreValues extends StatelessWidget {
  const _CoreValues();

  @override
  Widget build(BuildContext context) {
    final values = [
      (Icons.handshake, "Unity", "We stand together and uplift each other."),
      (Icons.volunteer_activism, "Compassion", "Kindness in action for all."),
      (Icons.public, "Responsibility", "Serve society with integrity."),
      (Icons.campaign, "Awareness", "Educate and inspire change."),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                "Our Core Values",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 18),
              LayoutBuilder(builder: (context, c) {
                final cross = c.maxWidth > 1100
                    ? 4
                    : c.maxWidth > 800
                        ? 3
                        : c.maxWidth > 520
                            ? 2
                            : 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cross,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: values.length,
                  itemBuilder: (context, i) {
                    return _HoverCard(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 14,
                              offset: const Offset(0, 6),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(values[i].$1,
                                size: 42, color: const Color(0xFF0F75FF)),
                            const SizedBox(height: 12),
                            Text(values[i].$2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Text(
                              values[i].$3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Colors.grey[700], height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 500.ms, delay: (i * 120).ms)
                        .scale(
                            begin: const Offset(0.98, 0.98),
                            end: const Offset(1, 1));
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Hoverable card (web/desktop)
class _HoverCard extends StatefulWidget {
  final Widget child;
  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.identity()..scale(_hover ? 1.03 : 1.0),
        child: widget.child,
      ),
    );
  }
}

// ===================== IMPACT STATS =====================
class _ImpactStats extends StatelessWidget {
  const _ImpactStats();

  @override
  Widget build(BuildContext context) {
    final stats = [
      ("People Helped", 1200),
      ("Events Conducted", 18),
      ("Active Volunteers", 45),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0F75FF), Color(0xFF00C2A8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: LayoutBuilder(builder: (context, c) {
              final isNarrow = c.maxWidth < 700;
              return Wrap(
                spacing: 28,
                runSpacing: 18,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  for (final s in stats)
                    _StatTile(label: s.$1, value: s.$2)
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.15, end: 0),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final int value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: value),
            duration: const Duration(seconds: 2),
            builder: (_, val, __) => Text(
              "$val+",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.95),
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ===================== CTA =====================
class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Join Us in Making a Difference",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Become a volunteer, partner with us, or support our initiatives to create lasting impact.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    // TODO: navigate to Contact / Volunteer form
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "Thanks for stepping up! We’ll add a form soon.")),
                    );
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text("Be a Volunteer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
