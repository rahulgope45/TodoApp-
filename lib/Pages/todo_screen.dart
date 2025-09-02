import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _tasks = [];
  int? _selectedTaskIndex; // Store the selected task index

  void _submitAdd(BuildContext context) {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add({"title": text, "done": false});
      });
      _textController.clear(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: const Text(
          "Your Tasks",
          style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent[100],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(
            color: Colors.black,
            thickness: 2,
            height: 2,
          ),
        ),
      ),

      resizeToAvoidBottomInset: true, // ✅ handle keyboard correctly

      body: Column(
        children: [
          // Task list at the top
          Expanded(
            child: _tasks.isEmpty
                ? const Center(
                    child: Text(
                      "No Task yet",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: ListTile(
                          title: Text(
                            "${index + 1}.${task["title"]}",//added Numbering for the tasks
                            style: TextStyle(
                              decoration: task["done"]
                              ? TextDecoration.lineThrough
                              :null,
                              color: task["done"] ? Colors.grey :Colors.black,
                            ),

                          ),
                          
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Checkbox(
                                value: task["done"],
                                onChanged: (checked){
                                  setState(() {
                                    task["done"] =checked ?? false;
                                  });
                                }
                                ),


                              IconButton(
                            onPressed: () {
                              setState(() {
                                _tasks.removeAt(index);
                                if (_selectedTaskIndex == index) {
                                  _selectedTaskIndex = null; // clear selection if deleted
                                }
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),

                            ],
                          )
                          
                           
                        ),
                      );
                    },
                  ),
          ),

          // ✅ Input stays above keyboard properly
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "New Task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onSubmitted: (_) => _submitAdd(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _submitAdd(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[200],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                    ),
                    child: const Icon(Icons.add),
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
