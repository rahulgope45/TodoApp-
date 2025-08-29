import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoScreen> { 

final TextEditingController _textController = TextEditingController();


//storing tasks
final List<String> _tasks = [];

//Onsubmit functions 
void _submitAdd(BuildContext context){
  final  text = _textController.text.trim();
  if(text.isNotEmpty){
    setState(() {
      _tasks.add(text);
    });
  }
}





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

      body: Center(
        child: Row(children: [
          Expanded(child: TextField(
            controller: _textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "New Task" ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            onSubmitted: (_)=> _submitAdd(context),
          )),
          ElevatedButton(
          onPressed: (){
            print("You have Pressed Adding Button");

          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[200],
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 16)
          ),
          child: 
          Icon((Icons.add)
          
          ),
           
          ),
        ],)
        
      ),
    );
  }
} 