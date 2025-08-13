import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Emergency! car accident at Highway 101. near hanuman Temple, exit 25', 'isUser': true},
    {'text': 'HOW many victims !! ARE they CONSCIOUS??\nCan you Describe the injuries?', 'isUser': false},
    {'text': '2 victims. one is unconscious with head injury and heavy blood loss and other has minor injuries.', 'isUser': true},
    {'text': 'Nearest Hospital is Medicover (2.1 km). they have 5 emergency beds and 2 ventilators available.\nDoctor Status : AVAILABLE\ndo you need an ambulance ?', 'isUser': false},
    {'text': 'yes', 'isUser': true},
    {'text': 'Dispatching ambulance to your location !!', 'isUser': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Helpline"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg['isUser'] ? Colors.blue[50] : Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg['text']),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 32, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
