import 'package:flutter/material.dart';

class PluginsScreen extends StatefulWidget {
  const PluginsScreen({Key? key}) : super(key: key);

  @override
  State<PluginsScreen> createState() => _PluginsScreenState();
}

class _PluginsScreenState extends State<PluginsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Plugins Screen")),
    );
  }
}
