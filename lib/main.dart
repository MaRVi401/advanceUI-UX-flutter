import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PracticalApp();
  }
}

class PracticalApp extends StatefulWidget {
  const PracticalApp({super.key});

  @override
  State<PracticalApp> createState() => _PracticalAppState();
}

class _PracticalAppState extends State<PracticalApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance UI/UX Flutter',
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: MainMenuPage(
        themeMode: themeMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;

  const MainMenuPage({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final modules = [
      ('1. Material 3 dan Design System', const Modul1Page()),
      ('2. Advanced Layout', const Modul2Page()),
      ('3. Responsive UI', const Modul3Page()),
      ('4. Adaptive UI', const Modul4Page()),
      ('5. Advanced Scrolling dengan Sliver', const Modul5Page()),
      ('6. Dialog, Bottom Sheet, Snackbar, & Overlay', const Modul6Page()),
      ('7. Implicit Animation', const Modul7Page()),
      ('8. Explicit Animation', const Modul8Page()),
      ('9. Curves dan Motion', const Modul9Page()),
      ('10. Page Transition', const Modul10Page()),
      ('11. Hero Animation', const Modul11Page()),
      ('12. Gesture dan Interaction', const Modul12Page()),
      ('13. Interactive Widgets', const Modul13Page()),
      ('14. Advanced Form dan Input', const Modul14Page()),
      ('15. Loading dan Feedback UI', const Modul15Page()),
      ('16. Skeleton Loading dan Shimmer', const Modul16Page()),
      (
        '17. Theme dan Dark Mode',
        Modul17Page(
          themeMode: themeMode,
          onThemeChanged: onThemeChanged,
        )
      ),
      ('18. Custom Widget dan Reusable UI', const Modul18Page()),
      ('19. CustomPainter', const Modul19Page()),
      ('20. Clip dan Visual Effects', const Modul20Page()),
      ('21. Opacity, Transform, dan Filter', const Modul21Page()),
      ('22. Accessibility', const Modul22Page()),
      ('23. UI State', const Modul23Page()),
      ('24. Micro Interaction', const Modul24Page()),
      ('25. Eksplorasi Widget Gallery', const Modul25Page()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Advance UI/UX'),
        actions: [
          Row(
            children: [
              const Icon(Icons.dark_mode, size: 20),
              Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: onThemeChanged,
              ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                modules[index].$1,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => modules[index].$2),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// MODUL 1: Material 3 dan Design System
// ==========================================
class Modul1Page extends StatelessWidget {
  const Modul1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Material 3 Explorer')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Typography', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Display Large', style: theme.textTheme.displayLarge),
          Text('Headline Medium', style: theme.textTheme.headlineMedium),
          Text('Body Large', style: theme.textTheme.bodyLarge),
          const SizedBox(height: 24),
          Text('Color Scheme', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ColorBox(label: 'Primary', color: colors.primary),
              ColorBox(label: 'Secondary', color: colors.secondary),
              ColorBox(label: 'Tertiary', color: colors.tertiary),
              ColorBox(label: 'Error', color: colors.error),
            ],
          ),
          const SizedBox(height: 24),
          Text('Buttons', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          const SizedBox(height: 24),
          Text('Input', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nama',
              hintText: 'Masukkan nama',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colors.primaryContainer,
                    child: Icon(Icons.design_services, color: colors.onPrimaryContainer),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Design System', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Eksplorasi Material 3 Flutter'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const ColorBox({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? Colors.white
              : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 2: Advanced Layout
// ==========================================
class Modul2Page extends StatelessWidget {
  const Modul2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Layout')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Expanded dan Flexible', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text('Expanded 2', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('Expanded 1'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text('Stack dan Positioned', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  top: 20,
                  child: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.dashboard, color: Colors.white, size: 36),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text('Wrap', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Flutter', 'Dart', 'Mobile', 'UI', 'UX', 'Material', 'Animation']
                .map((item) => Chip(label: Text(item)))
                .toList(),
          ),
          const SizedBox(height: 32),
          const Text('AspectRatio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: const Text('16 : 9', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 3: Responsive UI
// ==========================================
class Modul3Page extends StatelessWidget {
  const Modul3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          int columns = width < 500 ? 2 : (width < 900 ? 3 : 4);

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                  child: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ==========================================
// MODUL 4: Adaptive UI
// ==========================================
class Modul4Page extends StatefulWidget {
  const Modul4Page({super.key});

  @override
  State<Modul4Page> createState() => _Modul4PageState();
}

class _Modul4PageState extends State<Modul4Page> {
  int selectedIndex = 0;
  final pages = const [
    Center(child: Text('Home', style: TextStyle(fontSize: 30))),
    Center(child: Text('Search', style: TextStyle(fontSize: 30))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 700;

        return Scaffold(
          appBar: AppBar(title: const Text('Adaptive UI')),
          body: Row(
            children: [
              if (wide)
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => setState(() => selectedIndex = index),
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: Text('Search')),
                    NavigationRailDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: Text('Profile')),
                  ],
                ),
              Expanded(child: pages[selectedIndex]),
            ],
          ),
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => setState(() => selectedIndex = index),
                  destinations: const [
                    NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
                    NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
                    NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
                  ],
                ),
        );
      },
    );
  }
}

// ==========================================
// MODUL 5: Advanced Scrolling dengan Sliver
// ==========================================
class Modul5Page extends StatelessWidget {
  const Modul5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver UI'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blue]),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  child: Center(
                    child: Text('Grid ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                childCount: 12,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('List Item ${index + 1}'),
                subtitle: const Text('Contoh data pada SliverList'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 6: Feedback UI
// ==========================================
class Modul6Page extends StatelessWidget {
  const Modul6Page({super.key});

  void showDialogExample(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Ini adalah contoh AlertDialog.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup')),
        ],
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bottom Sheet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ListTile(leading: const Icon(Icons.camera), title: const Text('Camera'), onTap: () => Navigator.pop(context)),
              ListTile(leading: const Icon(Icons.photo), title: const Text('Gallery'), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback UI')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: () => showDialogExample(context), child: const Text('Show Dialog')),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: () => showSheet(context), child: const Text('Show Bottom Sheet')),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil disimpan')),
                  );
                },
                child: const Text('Show Snackbar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 7: Implicit Animation
// ==========================================
class Modul7Page extends StatefulWidget {
  const Modul7Page({super.key});

  @override
  State<Modul7Page> createState() => _Modul7PageState();
}

class _Modul7PageState extends State<Modul7Page> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: active ? 240 : 120,
              height: active ? 240 : 120,
              decoration: BoxDecoration(
                color: active ? Colors.purple : Colors.blue,
                borderRadius: BorderRadius.circular(active ? 40 : 100),
              ),
              child: const Icon(Icons.flutter_dash, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: active ? 1 : 0.3,
              child: const Text('Animated UI', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () => setState(() => active = !active),
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 8: Explicit Animation
// ==========================================
class Modul8Page extends StatefulWidget {
  const Modul8Page({super.key});

  @override
  State<Modul8Page> createState() => _Modul8PageState();
}

class _Modul8PageState extends State<Modul8Page> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    rotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: rotation,
          builder: (context, child) => Transform.rotate(angle: rotation.value * 6.28, child: child),
          child: const Icon(Icons.settings, size: 120),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.forward(from: 0),
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

// ==========================================
// MODUL 9: Curves dan Motion (Fix Overflow)
// ==========================================
class Modul9Page extends StatefulWidget {
  const Modul9Page({super.key});

  @override
  State<Modul9Page> createState() => _Modul9PageState();
}

class _Modul9PageState extends State<Modul9Page> {
  bool active = false;
  Curve selectedCurve = Curves.easeInOut;

  final curves = <String, Curve>{
    'easeInOut': Curves.easeInOut,
    'easeIn': Curves.easeIn,
    'easeOut': Curves.easeOut,
    'bounceOut': Curves.bounceOut,
    'elasticOut': Curves.elasticOut,
    'fastOutSlowIn': Curves.fastOutSlowIn,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curves')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                initialValue: curves.entries.firstWhere((entry) => entry.value == selectedCurve).key,
                decoration: const InputDecoration(labelText: 'Animation Curve', border: OutlineInputBorder()),
                items: curves.keys.map((name) => DropdownMenuItem(value: name, child: Text(name))).toList(),
                onChanged: (value) {
                  if (value != null) setState(() => selectedCurve = curves[value]!);
                },
              ),
              const SizedBox(height: 50),
              Align(
                alignment: active ? Alignment.centerRight : Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: selectedCurve,
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                ),
              ),
              const SizedBox(height: 80),
              FilledButton(
                onPressed: () => setState(() => active = !active),
                child: const Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 10: Page Transition
// ==========================================
class Modul10Page extends StatelessWidget {
  const Modul10Page({super.key});

  void openPage(BuildContext context, Widget page, Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) builder) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: builder,
      transitionDuration: const Duration(milliseconds: 600),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Transition')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => openPage(
                context,
                const DetailPage(title: 'Fade'),
                (_, animation, _, child) => FadeTransition(opacity: animation, child: child),
              ),
              child: const Text('Fade Transition'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => openPage(
                context,
                const DetailPage(title: 'Slide'),
                (_, animation, _, child) {
                  final offset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation);
                  return SlideTransition(position: offset, child: child);
                },
              ),
              child: const Text('Slide Transition'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => openPage(
                context,
                const DetailPage(title: 'Scale'),
                (_, animation, _, child) => ScaleTransition(scale: animation, child: child),
              ),
              child: const Text('Scale Transition'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
    );
  }
}

// ==========================================
// MODUL 11: Hero Animation
// ==========================================
class Modul11Page extends StatelessWidget {
  const Modul11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index % Colors.primaries.length];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Hero(
                tag: 'hero-$index',
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
                  child: const Icon(Icons.flutter_dash, color: Colors.white),
                ),
              ),
              title: Text('Item ${index + 1}'),
              subtitle: const Text('Tap untuk melihat Hero animation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HeroDetailPage(index: index, color: color)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  final int index;
  final Color color;

  const HeroDetailPage({super.key, required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail ${index + 1}')),
      body: Center(
        child: Hero(
          tag: 'hero-$index',
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
            child: const Icon(Icons.flutter_dash, size: 120, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 12: Gesture dan Interaction
// ==========================================
class Modul12Page extends StatefulWidget {
  const Modul12Page({super.key});

  @override
  State<Modul12Page> createState() => _Modul12PageState();
}

class _Modul12PageState extends State<Modul12Page> {
  String message = 'Coba berbagai gesture';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => message = 'Tap'),
              onDoubleTap: () => setState(() => message = 'Double Tap'),
              onLongPress: () => setState(() => message = 'Long Press'),
              onPanUpdate: (_) => setState(() => message = 'Dragging'),
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                child: const Icon(Icons.touch_app, color: Colors.white, size: 80),
              ),
            ),
            const SizedBox(height: 40),
            Text(message, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 13: Interactive Widgets
// ==========================================
class Modul13Page extends StatefulWidget {
  const Modul13Page({super.key});

  @override
  State<Modul13Page> createState() => _Modul13PageState();
}

class _Modul13PageState extends State<Modul13Page> {
  bool notifications = true;
  bool darkMode = false;
  double volume = 50;
  bool checked = false;
  int radio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text('Notifications'),
            value: notifications,
            onChanged: (val) => setState(() => notifications = val),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (val) => setState(() => darkMode = val),
          ),
          CheckboxListTile(
            title: const Text('Saya setuju'),
            value: checked,
            onChanged: (val) => setState(() => checked = val ?? false),
          ),
          const Divider(),
          ListTile(
            title: const Text('Option 1'),
            leading: Radio<int>(
              value: 1,
              groupValue: radio,
              onChanged: (val) => setState(() => radio = val!),
            ),
            onTap: () => setState(() => radio = 1),
          ),
          ListTile(
            title: const Text('Option 2'),
            leading: Radio<int>(
              value: 2,
              groupValue: radio,
              onChanged: (val) => setState(() => radio = val!),
            ),
            onTap: () => setState(() => radio = 2),
          ),
          ListTile(
            title: const Text('Option 3'),
            leading: Radio<int>(
              value: 3,
              groupValue: radio,
              onChanged: (val) => setState(() => radio = val!),
            ),
            onTap: () => setState(() => radio = 3),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text('Volume: ${volume.round()}'),
          Slider(
            value: volume,
            min: 0,
            max: 100,
            divisions: 10,
            label: volume.round().toString(),
            onChanged: (val) => setState(() => volume = val),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('Flutter'),
                selected: checked,
                onSelected: (val) => setState(() => checked = val),
              ),
              FilterChip(
                label: const Text('Mobile'),
                selected: notifications,
                onSelected: (val) => setState(() => notifications = val),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 14: Advanced Form dan Input
// ==========================================
class Modul14Page extends StatefulWidget {
  const Modul14Page({super.key});

  @override
  State<Modul14Page> createState() => _Modul14PageState();
}

class _Modul14PageState extends State<Modul14Page> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  DateTime? birthDate;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );

    if (date != null) setState(() => birthDate = date);
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form valid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Form')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.isEmpty ? 'Nama wajib diisi' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || !v.contains('@') ? 'Email tidak valid' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                  icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                ),
                border: const OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.length < 6 ? 'Minimal 6 karakter' : null,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: selectDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                birthDate == null
                    ? 'Pilih tanggal lahir'
                    : '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}',
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: submit, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 15: Loading dan Feedback UI (Fix Overflow)
// ==========================================
class Modul15Page extends StatefulWidget {
  const Modul15Page({super.key});

  @override
  State<Modul15Page> createState() => _Modul15PageState();
}

class _Modul15PageState extends State<Modul15Page> {
  bool loading = false;
  double progress = 0;

  void startProcess() {
    setState(() {
      loading = true;
      progress = 0;
    });

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() => progress += 0.05);

      if (progress >= 1) {
        timer.cancel();
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Proses selesai')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading & Feedback')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 24),
                      SizedBox(width: 250, child: LinearProgressIndicator(value: progress)),
                      const SizedBox(height: 12),
                      Text('${(progress * 100).round()}%'),
                    ],
                  )
                : FilledButton(onPressed: startProcess, child: const Text('Mulai Proses')),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 16: Skeleton Loading dan Shimmer
// ==========================================
class Modul16Page extends StatefulWidget {
  const Modul16Page({super.key});

  @override
  State<Modul16Page> createState() => _Modul16PageState();
}

class _Modul16PageState extends State<Modul16Page> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skeleton Loading')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (loading) return const SkeletonCard();

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Data ${index + 1}'),
              subtitle: const Text('Data telah selesai dimuat.'),
            ),
          );
        },
      ),
    );
  }
}

class SkeletonCard extends StatefulWidget {
  const SkeletonCard({super.key});

  @override
  State<SkeletonCard> createState() => _SkeletonCardState();
}

class _SkeletonCardState extends State<SkeletonCard> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment(-1 + controller.value * 2, 0),
              end: Alignment(controller.value * 2, 0),
              colors: const [Color(0xFFE5E7EB), Color(0xFFF9FAFB), Color(0xFFE5E7EB)],
            ),
          ),
        );
      },
    );
  }
}

// ==========================================
// MODUL 17: Theme dan Dark Mode (Fix Overflow)
// ==========================================
class Modul17Page extends StatelessWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;

  const Modul17Page({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme & Dark Mode')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isDark ? Icons.dark_mode : Icons.light_mode, size: 80),
                const SizedBox(height: 20),
                Text(
                  isDark ? 'Dark Mode' : 'Light Mode',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Switch(
                  value: isDark,
                  onChanged: onThemeChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 18: Custom Widget dan Reusable UI
// ==========================================
class Modul18Page extends StatelessWidget {
  const Modul18Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reusable UI')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ProfileCard(name: 'Ahmad', role: 'Flutter Developer', icon: Icons.code),
          ProfileCard(name: 'Budi', role: 'UI/UX Designer', icon: Icons.design_services),
          ProfileCard(name: 'Citra', role: 'Mobile Developer', icon: Icons.phone_android),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final IconData icon;

  const ProfileCard({super.key, required this.name, required this.role, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(radius: 30, child: Icon(icon)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(role),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MODUL 19: CustomPainter
// ==========================================
class Modul19Page extends StatelessWidget {
  const Modul19Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPainter')),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    final backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.indigo.shade100;

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..color = Colors.indigo;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 1.5,
      false,
      circlePaint,
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '75%',
        style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.indigo),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==========================================
// MODUL 20: Clip dan Visual Effects
// ==========================================
class Modul20Page extends StatelessWidget {
  const Modul20Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clip & Visual Effects')),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 300,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: const Center(
                    child: Text(
                      'Glass Effect',
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 21: Opacity, Transform, dan Filter
// ==========================================
class Modul21Page extends StatefulWidget {
  const Modul21Page({super.key});

  @override
  State<Modul21Page> createState() => _Modul21PageState();
}

class _Modul21PageState extends State<Modul21Page> {
  double rotation = 0;
  double scale = 1;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform & Filter')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Opacity(
              opacity: opacity,
              child: Transform.rotate(
                angle: rotation,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                    child: const Icon(Icons.flutter_dash, size: 90, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text('Rotation', style: Theme.of(context).textTheme.titleMedium),
          Slider(min: 0, max: 6.28, value: rotation, onChanged: (v) => setState(() => rotation = v)),
          Text('Scale', style: Theme.of(context).textTheme.titleMedium),
          Slider(min: 0.5, max: 2, value: scale, onChanged: (v) => setState(() => scale = v)),
          Text('Opacity', style: Theme.of(context).textTheme.titleMedium),
          Slider(min: 0, max: 1, value: opacity, onChanged: (v) => setState(() => opacity = v)),
          const SizedBox(height: 20),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: const Text('Blur', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 22: Accessibility
// ==========================================
class Modul22Page extends StatelessWidget {
  const Modul22Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            button: true,
            label: 'Tombol favorit',
            hint: 'Tekan untuk menambahkan favorit',
            child: Tooltip(
              message: 'Tambah ke favorit',
              child: IconButton(
                iconSize: 48,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Semantics(
            header: true,
            child: Text('Accessibility Friendly UI', style: Theme.of(context).textTheme.headlineSmall),
          ),
          const SizedBox(height: 16),
          const Text(
            'Gunakan ukuran teks yang cukup besar, kontras warna yang baik, label yang jelas, dan area sentuh yang cukup.',
          ),
          const SizedBox(height: 30),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.accessibility),
            label: const Text('Accessible Button'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 23: UI State (Fix Overflow)
// ==========================================
enum UiState { initial, loading, success, empty, error }

class Modul23Page extends StatefulWidget {
  const Modul23Page({super.key});

  @override
  State<Modul23Page> createState() => _Modul23PageState();
}

class _Modul23PageState extends State<Modul23Page> {
  UiState state = UiState.initial;

  Widget buildState() {
    switch (state) {
      case UiState.initial:
        return const StateView(icon: Icons.touch_app, title: 'Initial', message: 'Belum ada proses.');
      case UiState.loading:
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...'),
          ],
        );
      case UiState.success:
        return const StateView(icon: Icons.check_circle, title: 'Success', message: 'Data berhasil dimuat.');
      case UiState.empty:
        return const StateView(icon: Icons.inbox, title: 'Empty', message: 'Tidak ada data.');
      case UiState.error:
        return const StateView(icon: Icons.error, title: 'Error', message: 'Terjadi kesalahan.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI State')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: buildState(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  FilledButton(onPressed: () => setState(() => state = UiState.initial), child: const Text('Initial')),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: () => setState(() => state = UiState.loading), child: const Text('Loading')),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: () => setState(() => state = UiState.success), child: const Text('Success')),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: () => setState(() => state = UiState.empty), child: const Text('Empty')),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: () => setState(() => state = UiState.error), child: const Text('Error')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const StateView({super.key, required this.icon, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(message),
      ],
    );
  }
}

// ==========================================
// MODUL 24: Micro Interaction
// ==========================================
class Modul24Page extends StatefulWidget {
  const Modul24Page({super.key});

  @override
  State<Modul24Page> createState() => _Modul24PageState();
}

class _Modul24PageState extends State<Modul24Page> {
  bool favorite = false;
  bool expanded = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Micro Interaction')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTapDown: (_) => setState(() => pressed = true),
            onTapUp: (_) => setState(() => pressed = false),
            onTapCancel: () => setState(() => pressed = false),
            child: AnimatedScale(
              scale: pressed ? 0.95 : 1,
              duration: const Duration(milliseconds: 100),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 30, child: Icon(Icons.flutter_dash)),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text('Interactive Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        onPressed: () => setState(() => favorite = !favorite),
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            favorite ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey(favorite),
                            color: favorite ? Colors.red : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Expandable Card'),
                  trailing: IconButton(
                    onPressed: () => setState(() => expanded = !expanded),
                    icon: AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.expand_more),
                    ),
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  firstChild: const SizedBox.shrink(),
                  secondChild: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Konten tambahan ditampilkan dengan micro interaction.'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// MODUL 25: Eksplorasi Widget Gallery (Fixed Overflow)
// ==========================================
class Modul25Page extends StatelessWidget {
  const Modul25Page({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets = [
      ('Buttons', Icons.smart_button, 'FilledButton, OutlinedButton, TextButton'),
      ('Input', Icons.input, 'TextField dan TextFormField'),
      ('Navigation', Icons.navigation, 'NavigationBar dan NavigationRail'),
      ('Feedback', Icons.notifications, 'Dialog, Snackbar, BottomSheet'),
      ('Selection', Icons.check_box, 'Checkbox, Radio, Switch'),
      ('Layout', Icons.dashboard, 'Row, Column, Stack, Wrap'),
      ('Animation', Icons.animation, 'Implicit dan Explicit Animation'),
      ('Scrolling', Icons.view_agenda, 'ListView dan Sliver'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget Gallery')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9, // Diubah dari 1.15 ke 0.9 agar kartu lebih tinggi
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          final item = widgets[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12), // Dikurangi dari 16 ke 12
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.$2, size: 40), // Ukuran icon disesuaikan ke 40
                  const SizedBox(height: 8),
                  Text(
                    item.$1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Center(
                      child: Text(
                        item.$3,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}