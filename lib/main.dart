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
      title: 'Praktikum Advance UI/UX (50 Modul)',
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
    final originalModules = [
      ('Modul 1: Material 3 & Design System (Asli)', const Modul1AsliPage()),
      ('Modul 2: Advanced Layout (Asli)', const Modul2AsliPage()),
      ('Modul 3: Responsive UI (Asli)', const Modul3AsliPage()),
      ('Modul 4: Adaptive UI (Asli)', const Modul4AsliPage()),
      ('Modul 5: Advanced Scrolling dengan Sliver (Asli)', const Modul5AsliPage()),
      ('Modul 6: Feedback UI (Asli)', const Modul6AsliPage()),
      ('Modul 7: Implicit Animation (Asli)', const Modul7AsliPage()),
      ('Modul 8: Explicit Animation (Asli)', const Modul8AsliPage()),
      ('Modul 9: Curves dan Motion (Asli)', const Modul9AsliPage()),
      ('Modul 10: Page Transition (Asli)', const Modul10AsliPage()),
      ('Modul 11: Hero Animation (Asli)', const Modul11AsliPage()),
      ('Modul 12: Gesture dan Interaction (Asli)', const Modul12AsliPage()),
      ('Modul 13: Interactive Widgets (Asli)', const Modul13AsliPage()),
      ('Modul 14: Advanced Form dan Input (Asli)', const Modul14AsliPage()),
      ('Modul 15: Loading dan Feedback UI (Asli)', const Modul15AsliPage()),
      ('Modul 16: Skeleton Loading (Asli)', const Modul16AsliPage()),
      (
        'Modul 17: Theme dan Dark Mode (Asli)',
        Modul17AsliPage(themeMode: themeMode, onThemeChanged: onThemeChanged)
      ),
      ('Modul 18: Reusable UI (Asli)', const Modul18AsliPage()),
      ('Modul 19: CustomPainter (Asli)', const Modul19AsliPage()),
      ('Modul 20: Clip & Visual Effects (Asli)', const Modul20AsliPage()),
      ('Modul 21: Transform & Filter (Asli)', const Modul21AsliPage()),
      ('Modul 22: Accessibility (Asli)', const Modul22AsliPage()),
      ('Modul 23: UI State (Asli)', const Modul23AsliPage()),
      ('Modul 24: Micro Interaction (Asli)', const Modul24AsliPage()),
      ('Modul 25: Widget Gallery (Asli)', const Modul25AsliPage()),
    ];

    final experimentModules = [
      ('Modul 1: Dynamic Seed & M3 Toggle (Eksperimen)', const Modul1EksperimenPage()),
      ('Modul 2: Flex Ratio 3:2 (Eksperimen)', const Modul2EksperimenPage()),
      ('Modul 3: Breakpoint Custom 600/1000 (Eksperimen)', const Modul3EksperimenPage()),
      ('Modul 4: Extended NavRail Threshold (Eksperimen)', const Modul4EksperimenPage()),
      ('Modul 5: Custom Pinned/Floating Sliver (Eksperimen)', const Modul5EksperimenPage()),
      ('Modul 6: Draggable Sheet & Floating Snackbar (Eksperimen)', const Modul6EksperimenPage()),
      ('Modul 7: AnimatedAlign & Multianimasi (Eksperimen)', const Modul7EksperimenPage()),
      ('Modul 8: Repeat/Reverse Controller (Eksperimen)', const Modul8EksperimenPage()),
      ('Modul 9: Bounce & Elastic Motion (Eksperimen)', const Modul9EksperimenPage()),
      ('Modul 10: Rotation + Scale Combined (Eksperimen)', const Modul10EksperimenPage()),
      ('Modul 11: Circle-to-Square Flight Hero (Eksperimen)', const Modul11EksperimenPage()),
      ('Modul 12: Pan Drag & Dynamic Color (Eksperimen)', const Modul12EksperimenPage()),
      ('Modul 13: SliderTheme & FilterChip Tags (Eksperimen)', const Modul13EksperimenPage()),
      ('Modul 14: Match Password Validation (Eksperimen)', const Modul14EksperimenPage()),
      ('Modul 15: Custom Circular Gauge Progress (Eksperimen)', const Modul15EksperimenPage()),
      ('Modul 16: Shimmer Complex Profile Card (Eksperimen)', const Modul16EksperimenPage()),
      (
        'Modul 17: Dynamic Card Theme Switcher (Eksperimen)',
        Modul17EksperimenPage(themeMode: themeMode, onThemeChanged: onThemeChanged)
      ),
      ('Modul 18: Profile Card dengan Status Badge (Eksperimen)', const Modul18EksperimenPage()),
      ('Modul 19: Interactive Dynamic Gauge Painter (Eksperimen)', const Modul19EksperimenPage()),
      ('Modul 20: Glassmorphism Blur Slider (Eksperimen)', const Modul20EksperimenPage()),
      ('Modul 21: Live ImageFiltered Blur (Eksperimen)', const Modul21EksperimenPage()),
      ('Modul 22: Accessible Large Touch Target (Eksperimen)', const Modul22EksperimenPage()),
      ('Modul 23: Horizontal ChoiceChip State View (Eksperimen)', const Modul23EksperimenPage()),
      ('Modul 24: AnimatedScale Touch Feedback (Eksperimen)', const Modul24EksperimenPage()),
      ('Modul 25: RenderFlex Overflow Fix Gallery (Eksperimen)', const Modul25EksperimenPage()),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.code), text: '25 Versi Asli'),
              Tab(icon: Icon(Icons.science), text: '25 Versi Eksperimen'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildModuleList(context, originalModules, isExperiment: false),
            _buildModuleList(context, experimentModules, isExperiment: true),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleList(
    BuildContext context,
    List<(String, Widget)> modules, {
    required bool isExperiment,
  }) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: modules.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isExperiment
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: isExperiment
                      ? Theme.of(context).colorScheme.onTertiaryContainer
                      : Theme.of(context).colorScheme.onPrimaryContainer,
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
    );
  }
}

// ============================================================================
// MODUL 1: MATERIAL 3 & DESIGN SYSTEM
// ============================================================================

class Modul1AsliPage extends StatelessWidget {
  const Modul1AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Material 3 Explorer (Asli)')),
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
              ColorBoxAsli(label: 'Primary', color: colors.primary),
              ColorBoxAsli(label: 'Secondary', color: colors.secondary),
              ColorBoxAsli(label: 'Tertiary', color: colors.tertiary),
              ColorBoxAsli(label: 'Error', color: colors.error),
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
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
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

class ColorBoxAsli extends StatelessWidget {
  final String label;
  final Color color;

  const ColorBoxAsli({super.key, required this.label, required this.color});

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

class Modul1EksperimenPage extends StatefulWidget {
  const Modul1EksperimenPage({super.key});

  @override
  State<Modul1EksperimenPage> createState() => _Modul1EksperimenPageState();
}

class _Modul1EksperimenPageState extends State<Modul1EksperimenPage> {
  Color seedColor = Colors.green;
  bool useM3 = true;

  @override
  Widget build(BuildContext context) {
    final customTheme = ThemeData(
      useMaterial3: useM3,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
    );
    final colors = customTheme.colorScheme;

    return Theme(
      data: customTheme,
      child: Scaffold(
        appBar: AppBar(title: const Text('Material 3 (Eksperimen Interaktif)')),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Eksperimen 1 & 2: SeedColor & M3 Toggle',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      title: const Text('Gunakan Material 3 (useMaterial3)'),
                      value: useM3,
                      onChanged: (val) => setState(() => useM3 = val),
                    ),
                    const Divider(),
                    const Text('Pilih Seed Color:'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        ChoiceChip(
                          label: const Text('Indigo'),
                          selected: seedColor == Colors.indigo,
                          onSelected: (_) => setState(() => seedColor = Colors.indigo),
                        ),
                        ChoiceChip(
                          label: const Text('Green'),
                          selected: seedColor == Colors.green,
                          onSelected: (_) => setState(() => seedColor = Colors.green),
                        ),
                        ChoiceChip(
                          label: const Text('Orange'),
                          selected: seedColor == Colors.orange,
                          onSelected: (_) => setState(() => seedColor = Colors.orange),
                        ),
                        ChoiceChip(
                          label: const Text('Purple'),
                          selected: seedColor == Colors.purple,
                          onSelected: (_) => setState(() => seedColor = Colors.purple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Typography', style: customTheme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('Display Large', style: customTheme.textTheme.displayLarge),
            Text('Headline Medium', style: customTheme.textTheme.headlineMedium),
            Text('Body Large', style: customTheme.textTheme.bodyLarge),
            const SizedBox(height: 24),
            Text('Color Scheme', style: customTheme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ColorBoxAsli(label: 'Primary', color: colors.primary),
                ColorBoxAsli(label: 'Secondary', color: colors.secondary),
                ColorBoxAsli(label: 'Tertiary', color: colors.tertiary),
                ColorBoxAsli(label: 'Error', color: colors.error),
              ],
            ),
            const SizedBox(height: 24),
            Text('Buttons', style: customTheme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
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
                          Text('Hasil Eksperimen', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Perhatikan transisi warna dan gaya komponen.'),
                        ],
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
  }
}

// ============================================================================
// MODUL 2: ADVANCED LAYOUT
// ============================================================================

class Modul2AsliPage extends StatelessWidget {
  const Modul2AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Layout (Asli)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Expanded dan Flexible (Flex 2:1)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                  child: Text('Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
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
              child: const Text('16 : 9',
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class Modul2EksperimenPage extends StatefulWidget {
  const Modul2EksperimenPage({super.key});

  @override
  State<Modul2EksperimenPage> createState() => _Modul2EksperimenPageState();
}

class _Modul2EksperimenPageState extends State<Modul2EksperimenPage> {
  int flexLeft = 3;
  int flexRight = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Layout (Eksperimen Flex)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Ubah Nilai Flex: ($flexLeft : $flexRight)',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() {
                          flexLeft = 2;
                          flexRight = 1;
                        }),
                        child: const Text('2 : 1 (Asli)'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          flexLeft = 3;
                          flexRight = 2;
                        }),
                        child: const Text('3 : 2 (Eksperimen)'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: flexLeft,
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('Expanded $flexLeft (${((flexLeft / (flexLeft + flexRight)) * 100).toStringAsFixed(0)}%)',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: flexRight,
                  child: Container(
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: Text('Expanded $flexRight (${((flexRight / (flexLeft + flexRight)) * 100).toStringAsFixed(0)}%)',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
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

// ============================================================================
// MODUL 3: RESPONSIVE UI
// ============================================================================

class Modul3AsliPage extends StatelessWidget {
  const Modul3AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI (Asli)')),
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
                    'Item ${index + 1}\n($columns Kolom)',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

class Modul3EksperimenPage extends StatelessWidget {
  const Modul3EksperimenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI (Eksperimen Custom Breakpoint)')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          int columns = width < 600 ? 1 : (width < 1000 ? 2 : 4);

          return Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: Text(
                  'Lebar Layar: ${width.toStringAsFixed(0)} px | Jumlah Kolom: $columns',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Text('Card Eksperimen ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ============================================================================
// MODUL 4: ADAPTIVE UI
// ============================================================================

class Modul4AsliPage extends StatefulWidget {
  const Modul4AsliPage({super.key});

  @override
  State<Modul4AsliPage> createState() => _Modul4AsliPageState();
}

class _Modul4AsliPageState extends State<Modul4AsliPage> {
  int selectedIndex = 0;

  final pages = const [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 30))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 30))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 700;

        return Scaffold(
          appBar: AppBar(title: const Text('Adaptive UI (Asli)')),
          body: Row(
            children: [
              if (wide)
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => setState(() => selectedIndex = index),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.search_outlined),
                      selectedIcon: Icon(Icons.search),
                      label: Text('Search'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Profile'),
                    ),
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
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search_outlined),
                      selectedIcon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class Modul4EksperimenPage extends StatefulWidget {
  const Modul4EksperimenPage({super.key});

  @override
  State<Modul4EksperimenPage> createState() => _Modul4EksperimenPageState();
}

class _Modul4EksperimenPageState extends State<Modul4EksperimenPage> {
  int selectedIndex = 0;
  double customBreakpoint = 600;

  final pages = const [
    Center(child: Text('Home (Mode Adaptif)', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
    Center(child: Text('Search (Mode Adaptif)', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
    Center(child: Text('Profile (Mode Adaptif)', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final currentWidth = constraints.maxWidth;
        final wide = currentWidth >= customBreakpoint;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Adaptive UI (Eksperimen Custom Breakpoint)'),
          ),
          body: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Lebar: ${currentWidth.toStringAsFixed(0)}px | Mode: ${wide ? "NavigationRail" : "NavigationBar"}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    const Text('Threshold: ', style: TextStyle(fontSize: 12)),
                    DropdownButton<double>(
                      value: customBreakpoint,
                      isDense: true,
                      items: const [
                        DropdownMenuItem(value: 500, child: Text('500px')),
                        DropdownMenuItem(value: 600, child: Text('600px')),
                        DropdownMenuItem(value: 800, child: Text('800px')),
                      ],
                      onChanged: (val) {
                        if (val != null) setState(() => customBreakpoint = val);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    if (wide)
                      NavigationRail(
                        extended: currentWidth >= 900,
                        selectedIndex: selectedIndex,
                        onDestinationSelected: (index) => setState(() => selectedIndex = index),
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.home_outlined),
                            selectedIcon: Icon(Icons.home),
                            label: Text('Home'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.search_outlined),
                            selectedIcon: Icon(Icons.search),
                            label: Text('Search'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.person_outline),
                            selectedIcon: Icon(Icons.person),
                            label: Text('Profile'),
                          ),
                        ],
                      ),
                    Expanded(child: pages[selectedIndex]),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => setState(() => selectedIndex = index),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search_outlined),
                      selectedIcon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

// ============================================================================
// MODUL 5: ADVANCED SCROLLING DENGAN SLIVER
// ============================================================================

class Modul5AsliPage extends StatelessWidget {
  const Modul5AsliPage({super.key});

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
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.blue],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: Center(
                      child: Text(
                        'Grid ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
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
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('List Item ${index + 1}'),
                  subtitle: const Text('Contoh data pada SliverList'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class Modul5EksperimenPage extends StatefulWidget {
  const Modul5EksperimenPage({super.key});

  @override
  State<Modul5EksperimenPage> createState() => _Modul5EksperimenPageState();
}

class _Modul5EksperimenPageState extends State<Modul5EksperimenPage> {
  bool isPinned = true;
  bool isFloating = false;
  double expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: expandedHeight,
            pinned: isPinned,
            floating: isFloating,
            actions: [
              IconButton(
                icon: Icon(isPinned ? Icons.push_pin : Icons.push_pin_outlined),
                tooltip: 'Toggle Pin',
                onPressed: () => setState(() => isPinned = !isPinned),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver (Pinned: $isPinned)'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.indigo],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.layers, size: 80, color: Colors.white24),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Text('Kontrol Eksperimen SliverAppBar', style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilterChip(
                          label: const Text('Pinned'),
                          selected: isPinned,
                          onSelected: (val) => setState(() => isPinned = val),
                        ),
                        FilterChip(
                          label: const Text('Floating'),
                          selected: isFloating,
                          onSelected: (val) => setState(() => isFloating = val),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  color: Colors.teal.shade50,
                  child: Center(
                    child: Text('Grid Exp ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade900)),
                  ),
                ),
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                ),
                title: Text('Data Terstruktur ${index + 1}'),
                subtitle: const Text('Eksplorasi SliverList dinamis'),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MODUL 6: DIALOG, BOTTOM SHEET, SNACKBAR, DAN OVERLAY
// ============================================================================

class Modul6AsliPage extends StatelessWidget {
  const Modul6AsliPage({super.key});

  void showDialogExample(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Ini adalah contoh AlertDialog.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Bottom Sheet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback UI (Asli)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => showDialogExample(context),
                child: const Text('Show Dialog'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => showSheet(context),
                child: const Text('Show Bottom Sheet'),
              ),
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

class Modul6EksperimenPage extends StatelessWidget {
  const Modul6EksperimenPage({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded, size: 48, color: Colors.orange),
        title: const Text('Peringatan Eksperimen'),
        content: const Text('Apakah Anda yakin ingin melakukan proses enkripsi data lokal ini?'),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proses berhasil dijalankan!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Ya, Lanjutkan'),
          ),
        ],
      ),
    );
  }

  void showScrollableSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (_, scrollController) => ListView.builder(
          controller: scrollController,
          itemCount: 20,
          itemBuilder: (_, i) => ListTile(
            leading: const Icon(Icons.extension),
            title: Text('Opsi Eksperimen ${i + 1}'),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback UI (Eksperimen Custom Floating)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.add_alert),
                onPressed: () => showCustomDialog(context),
                label: const Text('Custom Dialog (Alert)'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.vertical_align_top),
                onPressed: () => showScrollableSheet(context),
                label: const Text('Draggable Bottom Sheet'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.info),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Snackbar kustom dengan tombol aksi!'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {},
                      ),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(16),
                    ),
                  );
                },
                label: const Text('Floating Snackbar + Action'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 7: IMPLICIT ANIMATION
// ============================================================================

class Modul7AsliPage extends StatefulWidget {
  const Modul7AsliPage({super.key});

  @override
  State<Modul7AsliPage> createState() => _Modul7AsliPageState();
}

class _Modul7AsliPageState extends State<Modul7AsliPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animation (Asli)')),
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
              child: const Text(
                'Animated UI',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
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

class Modul7EksperimenPage extends StatefulWidget {
  const Modul7EksperimenPage({super.key});

  @override
  State<Modul7EksperimenPage> createState() => _Modul7EksperimenPageState();
}

class _Modul7EksperimenPageState extends State<Modul7EksperimenPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animation (Eksperimen Align & Text)')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  alignment: active ? Alignment.topRight : Alignment.bottomLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    width: active ? 180 : 100,
                    height: active ? 180 : 100,
                    decoration: BoxDecoration(
                      color: active ? Colors.orange : Colors.teal,
                      borderRadius: BorderRadius.circular(active ? 20 : 50),
                      boxShadow: [
                        BoxShadow(
                          color: (active ? Colors.orange : Colors.teal).withOpacity(0.4),
                          blurRadius: 16,
                          spreadRadius: 4,
                        )
                      ],
                    ),
                    child: const Icon(Icons.ads_click, color: Colors.white, size: 48),
                  ),
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                style: TextStyle(
                  fontSize: active ? 32 : 18,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                  color: active ? Colors.orange : Colors.grey,
                ),
                child: const Text('Multi-Property Implicit Animation'),
              ),
              const SizedBox(height: 30),
              FilledButton.icon(
                icon: const Icon(Icons.play_circle),
                onPressed: () => setState(() => active = !active),
                label: const Text('Trigering Multianimasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 8: EXPLICIT ANIMATION
// ============================================================================

class Modul8AsliPage extends StatefulWidget {
  const Modul8AsliPage({super.key});

  @override
  State<Modul8AsliPage> createState() => _Modul8AsliPageState();
}

class _Modul8AsliPageState extends State<Modul8AsliPage> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

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
      appBar: AppBar(title: const Text('Explicit Animation (Asli)')),
      body: Center(
        child: AnimatedBuilder(
          animation: rotation,
          builder: (context, child) {
            return Transform.rotate(
              angle: rotation.value * 6.28,
              child: child,
            );
          },
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

class Modul8EksperimenPage extends StatefulWidget {
  const Modul8EksperimenPage({super.key});

  @override
  State<Modul8EksperimenPage> createState() => _Modul8EksperimenPageState();
}

class _Modul8EksperimenPageState extends State<Modul8EksperimenPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;
  late final Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack),
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
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
      appBar: AppBar(title: const Text('Explicit Animation (Eksperimen Repeat/Reverse)')),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
              scale: scaleAnimation.value,
              child: Transform.rotate(
                angle: rotationAnimation.value * 3.14,
                child: child,
              ),
            );
          },
          child: const Icon(Icons.explore, size: 100, color: Colors.indigo),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => controller.forward(from: 0),
              child: const Text('Forward'),
            ),
            ElevatedButton(
              onPressed: () => controller.repeat(reverse: true),
              child: const Text('Loop Repeat'),
            ),
            ElevatedButton(
              onPressed: () => controller.stop(),
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 9: CURVES DAN MOTION
// ============================================================================

class Modul9AsliPage extends StatefulWidget {
  const Modul9AsliPage({super.key});

  @override
  State<Modul9AsliPage> createState() => _Modul9AsliPageState();
}

class _Modul9AsliPageState extends State<Modul9AsliPage> {
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
      appBar: AppBar(title: const Text('Curves (Asli)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: curves.entries.firstWhere((e) => e.value == selectedCurve).key,
              decoration: const InputDecoration(
                labelText: 'Animation Curve',
                border: OutlineInputBorder(),
              ),
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
            const Spacer(),
            FilledButton(
              onPressed: () => setState(() => active = !active),
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}

class Modul9EksperimenPage extends StatefulWidget {
  const Modul9EksperimenPage({super.key});

  @override
  State<Modul9EksperimenPage> createState() => _Modul9EksperimenPageState();
}

class _Modul9EksperimenPageState extends State<Modul9EksperimenPage> {
  bool active = false;
  Curve selectedCurve = Curves.bounceOut;

  final curves = <String, Curve>{
    'bounceOut': Curves.bounceOut,
    'elasticOut': Curves.elasticOut,
    'bounceIn': Curves.bounceIn,
    'slowMiddle': Curves.slowMiddle,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curves (Eksperimen Scroll Safe)')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                initialValue: 'bounceOut',
                decoration: const InputDecoration(
                  labelText: 'Pilih Kurva Akselerasi Kustom',
                  border: OutlineInputBorder(),
                ),
                items: curves.keys.map((name) => DropdownMenuItem(value: name, child: Text(name))).toList(),
                onChanged: (value) {
                  if (value != null) setState(() => selectedCurve = curves[value]!);
                },
              ),
              const SizedBox(height: 40),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: active ? Alignment.centerRight : Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: selectedCurve,
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
                    child: const Icon(Icons.sports_basketball, color: Colors.white, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              FilledButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => setState(() => active = !active),
                label: const Text('Jalankan Animasi Motion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 10: PAGE TRANSITION
// ============================================================================

class Modul10AsliPage extends StatelessWidget {
  const Modul10AsliPage({super.key});

  void openPage(
    BuildContext context,
    Widget page,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) builder,
  ) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: builder,
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Transition (Asli)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                openPage(
                  context,
                  const DetailPage10(title: 'Fade'),
                  (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
                );
              },
              child: const Text('Fade Transition'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                openPage(
                  context,
                  const DetailPage10(title: 'Slide'),
                  (_, animation, __, child) {
                    final offset = Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation);
                    return SlideTransition(position: offset, child: child);
                  },
                );
              },
              child: const Text('Slide Transition'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                openPage(
                  context,
                  const DetailPage10(title: 'Scale'),
                  (_, animation, __, child) => ScaleTransition(scale: animation, child: child),
                );
              },
              child: const Text('Scale Transition'),
            ),
          ],
        ),
      ),
    );
  }
}

class Modul10EksperimenPage extends StatelessWidget {
  const Modul10EksperimenPage({super.key});

  void openCombinedPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => const DetailPage10(title: 'Kombinasi Rotation & Scale'),
        transitionsBuilder: (_, animation, __, child) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
            ),
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Transition (Eksperimen Kombinasi)')),
      body: Center(
        child: FilledButton.icon(
          icon: const Icon(Icons.flip_camera_android),
          onPressed: () => openCombinedPage(context),
          label: const Text('Transisi Kombinasi Rotation + Scale'),
        ),
      ),
    );
  }
}

class DetailPage10 extends StatelessWidget {
  final String title;
  const DetailPage10({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ============================================================================
// MODUL 11: HERO ANIMATION
// ============================================================================

class Modul11AsliPage extends StatelessWidget {
  const Modul11AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation (Asli)')),
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
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.flutter_dash, color: Colors.white),
                ),
              ),
              title: Text('Item ${index + 1}'),
              subtitle: const Text('Tap untuk melihat Hero animation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HeroDetailPageAsli(index: index, color: color),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HeroDetailPageAsli extends StatelessWidget {
  final int index;
  final Color color;

  const HeroDetailPageAsli({super.key, required this.index, required this.color});

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
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(Icons.flutter_dash, size: 120, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Modul11EksperimenPage extends StatelessWidget {
  const Modul11EksperimenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation (Eksperimen Custom Flight)')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          final color = Colors.accents[index % Colors.accents.length];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HeroDetailPageEksperimen(index: index, color: color),
                ),
              );
            },
            child: Card(
              color: color.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'hero-grid-$index',
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black26)],
                      ),
                      child: const Icon(Icons.science, color: Colors.white, size: 36),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Eksperimen ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeroDetailPageEksperimen extends StatelessWidget {
  final int index;
  final Color color;

  const HeroDetailPageEksperimen({super.key, required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Eksperimen ${index + 1}')),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Hero(
                tag: 'hero-grid-$index',
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(blurRadius: 20, color: color.withOpacity(0.5))],
                  ),
                  child: const Icon(Icons.science, size: 140, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Transisi Hero dengan perubahan bentuk dari Lingkaran ke Rounded Rectangle!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 12: GESTURE DAN INTERACTION
// ============================================================================

class Modul12AsliPage extends StatefulWidget {
  const Modul12AsliPage({super.key});

  @override
  State<Modul12AsliPage> createState() => _Modul12AsliPageState();
}

class _Modul12AsliPageState extends State<Modul12AsliPage> {
  String message = 'Coba berbagai gesture';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture (Asli)')),
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
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30),
                ),
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

class Modul12EksperimenPage extends StatefulWidget {
  const Modul12EksperimenPage({super.key});

  @override
  State<Modul12EksperimenPage> createState() => _Modul12EksperimenPageState();
}

class _Modul12EksperimenPageState extends State<Modul12EksperimenPage> {
  String message = 'Gestur Interaktif Dinamis';
  Offset boxPosition = Offset.zero;
  Color boxColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture (Eksperimen Drag & Color Change)')),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text('Geser kotak di bawah atau tap 2x untuk ubah warna!', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Positioned(
            left: 100 + boxPosition.dx,
            top: 200 + boxPosition.dy,
            child: GestureDetector(
              onTap: () => setState(() => message = 'Tap Terdeteksi'),
              onDoubleTap: () {
                setState(() {
                  message = 'Double Tap (Warna Berubah)';
                  boxColor = boxColor == Colors.deepOrange ? Colors.indigo : Colors.deepOrange;
                });
              },
              onLongPress: () => setState(() => message = 'Long Press (Tahan)'),
              onPanUpdate: (details) {
                setState(() {
                  boxPosition += details.delta;
                  message = 'Mengeser ke (${boxPosition.dx.toStringAsFixed(0)}, ${boxPosition.dy.toStringAsFixed(0)})';
                });
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [BoxShadow(blurRadius: 12, color: Colors.black26)],
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.open_with, color: Colors.white, size: 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MODUL 13: INTERACTIVE WIDGETS
// ============================================================================

class Modul13AsliPage extends StatefulWidget {
  const Modul13AsliPage({super.key});

  @override
  State<Modul13AsliPage> createState() => _Modul13AsliPageState();
}

class _Modul13AsliPageState extends State<Modul13AsliPage> {
  bool notifications = true;
  bool darkMode = false;
  double volume = 50;
  bool checked = false;
  int radio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Widgets (Asli)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text('Notifications'),
            value: notifications,
            onChanged: (value) => setState(() => notifications = value),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (value) => setState(() => darkMode = value),
          ),
          CheckboxListTile(
            title: const Text('Saya setuju'),
            value: checked,
            onChanged: (value) => setState(() => checked = value ?? false),
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
            onChanged: (value) => setState(() => volume = value),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('Flutter'),
                selected: checked,
                onSelected: (value) => setState(() => checked = value),
              ),
              FilterChip(
                label: const Text('Mobile'),
                selected: notifications,
                onSelected: (value) => setState(() => notifications = value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Modul13EksperimenPage extends StatefulWidget {
  const Modul13EksperimenPage({super.key});

  @override
  State<Modul13EksperimenPage> createState() => _Modul13EksperimenPageState();
}

class _Modul13EksperimenPageState extends State<Modul13EksperimenPage> {
  double brightnessLevel = 75;
  final selectedTags = <String>{'UI/UX'};

  final availableTags = ['UI/UX', 'Flutter', 'Dart', 'Animation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Widgets (Eksperimen Segmented)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Brightness: ${brightnessLevel.round()}%', style: const TextStyle(fontWeight: FontWeight.bold)),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.amber,
              thumbColor: Colors.amber.shade800,
            ),
            child: Slider(
              value: brightnessLevel,
              min: 0,
              max: 100,
              divisions: 20,
              label: '${brightnessLevel.round()}%',
              onChanged: (val) => setState(() => brightnessLevel = val),
            ),
          ),
          const Divider(height: 32),
          const Text('Multi-Select FilterChip Tags:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: availableTags.map((tag) {
              final isSelected = selectedTags.contains(tag);
              return FilterChip(
                label: Text(tag),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedTags.add(tag);
                    } else {
                      selectedTags.remove(tag);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Card(
            color: Colors.amber.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Tag Terpilih: ${selectedTags.isEmpty ? 'Tidak ada' : selectedTags.join(', ')}',
                style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MODUL 14: ADVANCED FORM DAN INPUT
// ============================================================================

class Modul14AsliPage extends StatefulWidget {
  const Modul14AsliPage({super.key});

  @override
  State<Modul14AsliPage> createState() => _Modul14AsliPageState();
}

class _Modul14AsliPageState extends State<Modul14AsliPage> {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form valid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Form (Asli)')),
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
              validator: (value) => value == null || value.isEmpty ? 'Nama wajib diisi' : null,
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
              validator: (value) => value == null || !value.contains('@') ? 'Email tidak valid' : null,
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
              validator: (value) => value == null || value.length < 6 ? 'Minimal 6 karakter' : null,
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

class Modul14EksperimenPage extends StatefulWidget {
  const Modul14EksperimenPage({super.key});

  @override
  State<Modul14EksperimenPage> createState() => _Modul14EksperimenPageState();
}

class _Modul14EksperimenPageState extends State<Modul14EksperimenPage> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Form (Eksperimen Match Password)')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                prefixIcon: Icon(Icons.phone),
                prefixText: '+62 ',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.length < 9 ? 'Nomor telepon tidak valid' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password Baru',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                  icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                ),
                border: const OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.length < 6 ? 'Minimal 6 karakter' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: obscurePassword,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password',
                prefixIcon: Icon(Icons.lock_reset),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v != passwordController.text) {
                  return 'Konfirmasi password tidak cocok!';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              icon: const Icon(Icons.check_circle),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registrasi Berhasil!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              label: const Text('Validasi & Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 15: LOADING DAN FEEDBACK UI
// ============================================================================

class Modul15AsliPage extends StatefulWidget {
  const Modul15AsliPage({super.key});

  @override
  State<Modul15AsliPage> createState() => _Modul15AsliPageState();
}

class _Modul15AsliPageState extends State<Modul15AsliPage> {
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Proses selesai')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading & Feedback (Asli)')),
      body: Center(
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
    );
  }
}

class Modul15EksperimenPage extends StatefulWidget {
  const Modul15EksperimenPage({super.key});

  @override
  State<Modul15EksperimenPage> createState() => _Modul15EksperimenPageState();
}

class _Modul15EksperimenPageState extends State<Modul15EksperimenPage> {
  bool loading = false;
  double progress = 0;

  void startCustomProcess() {
    setState(() {
      loading = true;
      progress = 0;
    });

    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() => progress += 0.02);

      if (progress >= 1) {
        timer.cancel();
        setState(() => loading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading & Feedback (Eksperimen Scroll Safe)')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 8,
                              color: Colors.indigo,
                              backgroundColor: Colors.indigo.shade100,
                            ),
                          ),
                          Text(
                            '${(progress * 100).round()}%',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Text('Mengunduh paket data baru...'),
                    ],
                  )
                : FilledButton.icon(
                    icon: const Icon(Icons.download),
                    onPressed: startCustomProcess,
                    label: const Text('Simulasi Download Data'),
                  ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 16: SKELETON LOADING DAN SHIMMER
// ============================================================================

class Modul16AsliPage extends StatefulWidget {
  const Modul16AsliPage({super.key});

  @override
  State<Modul16AsliPage> createState() => _Modul16AsliPageState();
}

class _Modul16AsliPageState extends State<Modul16AsliPage> {
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
      appBar: AppBar(title: const Text('Skeleton Loading (Asli)')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (loading) return const SkeletonCardAsli();

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

class SkeletonCardAsli extends StatefulWidget {
  const SkeletonCardAsli({super.key});

  @override
  State<SkeletonCardAsli> createState() => _SkeletonCardAsliState();
}

class _SkeletonCardAsliState extends State<SkeletonCardAsli> with SingleTickerProviderStateMixin {
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
              colors: const [
                Color(0xFFE5E7EB),
                Color(0xFFF9FAFB),
                Color(0xFFE5E7EB),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Modul16EksperimenPage extends StatefulWidget {
  const Modul16EksperimenPage({super.key});

  @override
  State<Modul16EksperimenPage> createState() => _Modul16EksperimenPageState();
}

class _Modul16EksperimenPageState extends State<Modul16EksperimenPage> {
  bool loading = true;

  void refreshData() {
    setState(() => loading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => loading = false);
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton Loading (Eksperimen Complex Layout)'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: refreshData),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          if (loading) return const SkeletonCardComplex();

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.indigo.shade100, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.person, size: 36, color: Colors.indigo),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pengguna ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        const Text('Deskripsi profil data lengkap...'),
                      ],
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

class SkeletonCardComplex extends StatefulWidget {
  const SkeletonCardComplex({super.key});

  @override
  State<SkeletonCardComplex> createState() => _SkeletonCardComplexState();
}

class _SkeletonCardComplexState extends State<SkeletonCardComplex> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();
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
        final shimmerGradient = LinearGradient(
          begin: Alignment(-1 + controller.value * 2, 0),
          end: Alignment(controller.value * 2, 0),
          colors: const [Color(0xFFE0E0E0), Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
        );

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: shimmerGradient),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 16, width: 120, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), gradient: shimmerGradient)),
                      const SizedBox(height: 8),
                      Container(height: 12, width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), gradient: shimmerGradient)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ============================================================================
// MODUL 17: THEME DAN DARK MODE
// ============================================================================

class Modul17AsliPage extends StatelessWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;

  const Modul17AsliPage({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme & Dark Mode (Asli)')),
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

class Modul17EksperimenPage extends StatelessWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;

  const Modul17EksperimenPage({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme & Dark Mode (Eksperimen Card Switcher)')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                color: isDark ? Colors.grey.shade900 : Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(isDark ? Icons.nights_stay : Icons.wb_sunny, size: 40, color: isDark ? Colors.amber : Colors.orange),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(isDark ? 'Mode Gelap Aktif' : 'Mode Terang Aktif', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(isDark ? 'Menghemat daya baterai OLED' : 'Sesuai pencahayaan siang hari'),
                          ],
                        ),
                      ),
                      Switch(value: isDark, onChanged: onThemeChanged),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 18: CUSTOM WIDGET DAN REUSABLE UI
// ============================================================================

class Modul18AsliPage extends StatelessWidget {
  const Modul18AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reusable UI (Asli)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ProfileCardAsli(name: 'Ahmad', role: 'Flutter Developer', icon: Icons.code),
          ProfileCardAsli(name: 'Budi', role: 'UI/UX Designer', icon: Icons.design_services),
          ProfileCardAsli(name: 'Citra', role: 'Mobile Developer', icon: Icons.phone_android),
        ],
      ),
    );
  }
}

class ProfileCardAsli extends StatelessWidget {
  final String name;
  final String role;
  final IconData icon;

  const ProfileCardAsli({
    super.key,
    required this.name,
    required this.role,
    required this.icon,
  });

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

class Modul18EksperimenPage extends StatelessWidget {
  const Modul18EksperimenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reusable UI (Eksperimen Custom Badge)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ProfileCardEksperimen(
            name: 'Ahmad Yassin',
            role: 'Full-stack Engineer',
            status: 'Online',
            statusColor: Colors.green,
            icon: Icons.code,
          ),
          ProfileCardEksperimen(
            name: 'Uswa',
            role: 'Product Designer',
            status: 'Busy',
            statusColor: Colors.red,
            icon: Icons.brush,
          ),
        ],
      ),
    );
  }
}

class ProfileCardEksperimen extends StatelessWidget {
  final String name;
  final String role;
  final String status;
  final Color statusColor;
  final IconData icon;

  const ProfileCardEksperimen({
    super.key,
    required this.name,
    required this.role,
    required this.status,
    required this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(radius: 28, child: Icon(icon)),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(role, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Chip(
              label: Text(status, style: TextStyle(color: statusColor, fontSize: 10)),
              backgroundColor: statusColor.withOpacity(0.1),
              side: BorderSide.none,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 19: CUSTOMPAINTER
// ============================================================================

class Modul19AsliPage extends StatelessWidget {
  const Modul19AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPainter (Asli)')),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: CirclePainterAsli(),
        ),
      ),
    );
  }
}

class CirclePainterAsli extends CustomPainter {
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

class Modul19EksperimenPage extends StatefulWidget {
  const Modul19EksperimenPage({super.key});

  @override
  State<Modul19EksperimenPage> createState() => _Modul19EksperimenPageState();
}

class _Modul19EksperimenPageState extends State<Modul19EksperimenPage> {
  double progress = 0.85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPainter (Eksperimen Dynamic Gauge)')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(260, 260),
            painter: DynamicGaugePainter(progress: progress),
          ),
          const SizedBox(height: 40),
          Text('Progress: ${(progress * 100).round()}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Slider(
            value: progress,
            onChanged: (val) => setState(() => progress = val),
          ),
        ],
      ),
    );
  }
}

class DynamicGaugePainter extends CustomPainter {
  final double progress;

  DynamicGaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..color = Colors.grey.shade300;

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..color = Colors.teal;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant DynamicGaugePainter oldDelegate) => oldDelegate.progress != progress;
}

// ============================================================================
// MODUL 20: CLIP DAN VISUAL EFFECTS
// ============================================================================

class Modul20AsliPage extends StatelessWidget {
  const Modul20AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clip & Visual Effects (Asli)')),
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

class Modul20EksperimenPage extends StatefulWidget {
  const Modul20EksperimenPage({super.key});

  @override
  State<Modul20EksperimenPage> createState() => _Modul20EksperimenPageState();
}

class _Modul20EksperimenPageState extends State<Modul20EksperimenPage> {
  double blurSigma = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clip & Visual Effects (Eksperimen Blur Slider)')),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepOrange, Colors.indigo]),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: Container(
                  width: 320,
                  height: 260,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Glassmorphism Kustom',
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text('Blur Sigma: ${blurSigma.toStringAsFixed(1)}', style: const TextStyle(color: Colors.white)),
                      Slider(
                        value: blurSigma,
                        min: 0,
                        max: 30,
                        activeColor: Colors.white,
                        onChanged: (val) => setState(() => blurSigma = val),
                      ),
                    ],
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

// ============================================================================
// MODUL 21: OPACITY, TRANSFORM, DAN FILTER
// ============================================================================

class Modul21AsliPage extends StatefulWidget {
  const Modul21AsliPage({super.key});

  @override
  State<Modul21AsliPage> createState() => _Modul21AsliPageState();
}

class _Modul21AsliPageState extends State<Modul21AsliPage> {
  double rotation = 0;
  double scale = 1;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform & Filter (Asli)')),
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
        ],
      ),
    );
  }
}

class Modul21EksperimenPage extends StatefulWidget {
  const Modul21EksperimenPage({super.key});

  @override
  State<Modul21EksperimenPage> createState() => _Modul21EksperimenPageState();
}

class _Modul21EksperimenPageState extends State<Modul21EksperimenPage> {
  double blurValue = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform & Filter (Eksperimen ImageFiltered)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: Card(
              color: Colors.indigo,
              child: Container(
                height: 120,
                alignment: Alignment.center,
                child: const Text('Filtered Box',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text('Filter Blur Sigma: ${blurValue.toStringAsFixed(1)}', style: const TextStyle(fontWeight: FontWeight.bold)),
          Slider(
            min: 0,
            max: 10,
            value: blurValue,
            onChanged: (val) => setState(() => blurValue = val),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MODUL 22: ACCESSIBILITY
// ============================================================================

class Modul22AsliPage extends StatelessWidget {
  const Modul22AsliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility (Asli)')),
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
        ],
      ),
    );
  }
}

class Modul22EksperimenPage extends StatelessWidget {
  const Modul22EksperimenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility (Eksperimen Large Touch Target)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            label: 'Tombol konfirmasi pembayaran utama',
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: () {},
              icon: const Icon(Icons.payment, size: 28),
              label: const Text('Bayar Sekarang (Area Sentuh 60dp)', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MODUL 23: UI STATE
// ============================================================================

enum UiState { initial, loading, success, empty, error }

class Modul23AsliPage extends StatefulWidget {
  const Modul23AsliPage({super.key});

  @override
  State<Modul23AsliPage> createState() => _Modul23AsliPageState();
}

class _Modul23AsliPageState extends State<Modul23AsliPage> {
  UiState state = UiState.initial;

  Widget buildState() {
    switch (state) {
      case UiState.initial:
        return const StateViewAsli(icon: Icons.touch_app, title: 'Initial', message: 'Belum ada proses.');
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
        return const StateViewAsli(icon: Icons.check_circle, title: 'Success', message: 'Data berhasil dimuat.');
      case UiState.empty:
        return const StateViewAsli(icon: Icons.inbox, title: 'Empty', message: 'Tidak ada data.');
      case UiState.error:
        return const StateViewAsli(icon: Icons.error, title: 'Error', message: 'Terjadi kesalahan.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI State (Asli)')),
      body: Column(
        children: [
          Expanded(child: Center(child: buildState())),
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
    );
  }
}

class StateViewAsli extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const StateViewAsli({super.key, required this.icon, required this.title, required this.message});

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

class Modul23EksperimenPage extends StatefulWidget {
  const Modul23EksperimenPage({super.key});

  @override
  State<Modul23EksperimenPage> createState() => _Modul23EksperimenPageState();
}

class _Modul23EksperimenPageState extends State<Modul23EksperimenPage> {
  UiState state = UiState.initial;

  Widget buildStateView() {
    switch (state) {
      case UiState.initial:
        return const Column(
          children: [
            Icon(Icons.touch_app, size: 70, color: Colors.blue),
            SizedBox(height: 12),
            Text('Silakan jalankan simulasi state.', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        );
      case UiState.loading:
        return const CircularProgressIndicator();
      case UiState.success:
        return const Column(
          children: [
            Icon(Icons.check_circle, size: 70, color: Colors.green),
            SizedBox(height: 12),
            Text('Data berhasil diambil dari server!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        );
      case UiState.empty:
        return const Column(
          children: [
            Icon(Icons.folder_open, size: 70, color: Colors.orange),
            SizedBox(height: 12),
            Text('Kotak masuk Anda kosong.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
          ],
        );
      case UiState.error:
        return const Column(
          children: [
            Icon(Icons.wifi_off, size: 70, color: Colors.red),
            SizedBox(height: 12),
            Text('Gagal terhubung ke jaringan.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI State (Eksperimen Scroll Safe)')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(30),
                  child: buildStateView(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ChoiceChip(label: const Text('Initial'), selected: state == UiState.initial, onSelected: (_) => setState(() => state = UiState.initial)),
                  const SizedBox(width: 8),
                  ChoiceChip(label: const Text('Loading'), selected: state == UiState.loading, onSelected: (_) => setState(() => state = UiState.loading)),
                  const SizedBox(width: 8),
                  ChoiceChip(label: const Text('Success'), selected: state == UiState.success, onSelected: (_) => setState(() => state = UiState.success)),
                  const SizedBox(width: 8),
                  ChoiceChip(label: const Text('Empty'), selected: state == UiState.empty, onSelected: (_) => setState(() => state = UiState.empty)),
                  const SizedBox(width: 8),
                  ChoiceChip(label: const Text('Error'), selected: state == UiState.error, onSelected: (_) => setState(() => state = UiState.error)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 24: MICRO INTERACTION
// ============================================================================

class Modul24AsliPage extends StatefulWidget {
  const Modul24AsliPage({super.key});

  @override
  State<Modul24AsliPage> createState() => _Modul24AsliPageState();
}

class _Modul24AsliPageState extends State<Modul24AsliPage> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Micro Interaction (Asli)')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
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
        ],
      ),
    );
  }
}

class Modul24EksperimenPage extends StatefulWidget {
  const Modul24EksperimenPage({super.key});

  @override
  State<Modul24EksperimenPage> createState() => _Modul24EksperimenPageState();
}

class _Modul24EksperimenPageState extends State<Modul24EksperimenPage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Micro Interaction (Eksperimen Scale Feedback)')),
      body: Center(
        child: GestureDetector(
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) => setState(() => isPressed = false),
          onTapCancel: () => setState(() => isPressed = false),
          child: AnimatedScale(
            scale: isPressed ? 0.92 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Card(
              color: Colors.indigo,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.touch_app, color: Colors.white),
                    SizedBox(width: 12),
                    Text('Tekan Kartu Ini (Micro Feedback)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MODUL 25: EKSPLORASI WIDGET GALLERY
// ============================================================================

class Modul25AsliPage extends StatelessWidget {
  const Modul25AsliPage({super.key});

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
      appBar: AppBar(title: const Text('Flutter Widget Gallery (Asli)')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          final item = widgets[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.$2, size: 48),
                  const SizedBox(height: 12),
                  Text(item.$1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(item.$3, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Modul25EksperimenPage extends StatelessWidget {
  const Modul25EksperimenPage({super.key});

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
      appBar: AppBar(title: const Text('Flutter Widget Gallery (Eksperimen Fixed)')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          final item = widgets[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.$2, size: 40),
                  const SizedBox(height: 8),
                  Text(item.$1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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