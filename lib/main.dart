import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const BaseLayout(title: 'Base Layout'),
    );
  }
}

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.title});

  final String title;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        elevation: 4.0,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait = constraints.maxWidth < constraints.maxHeight;

          return Column(
            children: [
              // Top Section
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Header Section',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // Main Content Section
              Expanded(
                flex: 6,
                child: Center(
                  child: Container(
                    width: size.width * 0.7,
                    height: isPortrait ? size.height * 0.4 : size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Main Content',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Section
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Footer Section',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for floating button
        },
        tooltip: 'Add',
        backgroundColor: Colors.blue.shade600,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
