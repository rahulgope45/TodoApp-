import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _tasks = [];
  int? _selectedTaskIndex; //Store the Selected task index

  void _submitAdd(BuildContext context) {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
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
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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

      // ✅ This makes the screen resize when the keyboard appears
      resizeToAvoidBottomInset: true,

      body: RadioGroup<int>(
        groupValue: _selectedTaskIndex,
        onChanged: (value) {
          setState(() {
            _selectedTaskIndex = value;
          });
        },
        child: Column(
          children: [
            // Task list at the top
            Expanded(
              child: _tasks.isEmpty
                  ? const Center( 
                      child: Text(
                        "No Task yet",
                        
                        style: TextStyle(
                          fontSize: 18, color: Colors.black,),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: ListTile(
                            title: Text(_tasks[index]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                              onPressed: (){
                                setState(() {
                                  _tasks.removeAt(index);
                                }); 
                              },
                               icon: const Icon(Icons.delete)),
                               Radio<bool>(
                                value: true,
                                groupValue: false,
                                onChanged: (value) {
                                  
                                  setState(() {
                                    print("Task ${_tasks[index]} selected");
                                  });
                                },
                                )

                              ],
                            ) 
                               
                               
                          ),
                        
                        );
                        
                      },
                    ),
            ),
                                                                             
            // ✅ Input box + button at the bottom, moves with keyboard
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 8, // moves with keyboard
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      autofocus: false,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
