import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoScreen> { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100], 
      appBar: AppBar(
        title: Text("Your Tasks",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,
        
        ),
        
        ),
        backgroundColor: Colors.yellowAccent[100],
        bottom: const PreferredSize(preferredSize: Size.fromHeight(2), 
        child: Divider(
          color: Colors.black,
          thickness: 2,
          height: 2,
        )
        ),
        
        
      ),
    );
  }
} 