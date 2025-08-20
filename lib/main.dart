import 'package:flutter/material.dart';

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
  String currentPage = "Home";

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
        backgroundColor: const Color.fromARGB(255, 181, 227, 248),
        title: const Text(
          "ऐक्यम युनिटी फाउंडेशन",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          for (String page in pages.keys)
            TextButton(
              onPressed: () => setState(() => currentPage = page),
              child: Text(
                page,
                style: TextStyle(
                  color: currentPage == page
                      ? const Color.fromARGB(255, 246, 246, 103)
                      : Colors.white,
                  fontWeight:
                      currentPage == page ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
        ],
      ),
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
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/aikyam_bg.jpg",
              ),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 160, left: 16, right: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Together We Are One",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16),
                Text(
                  "Aikyam Unity Foundation",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                  ),
                  textAlign: TextAlign.start,
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
    return Center(
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "About Us",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Aikyam Unity Foundation is a youth-driven initiative working for social causes. "
                "We started with a vision to bring people together for positive change in society. "
                "Our mission is to promote unity, compassion, and action through meaningful projects.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
            ],
          ),
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
    if (width < 600)
      crossAxisCount = 1; // Mobile
    else if (width < 900) crossAxisCount = 2; // Tablet

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
          return Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset('assets/images/bg1.jpg',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(events[index]["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
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
