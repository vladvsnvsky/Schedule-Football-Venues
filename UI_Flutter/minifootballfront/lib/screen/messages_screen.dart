import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);
  // Sample data for message threads
  static const List<Map<String, String>> messages = [
    {'sender': 'Alice', 'snippet': 'Hey, how are you doing?'},
    {'sender': 'Bob', 'snippet': 'Meeting at 3 PM confirmed!'},
    {'sender': 'Charlie', 'snippet': 'Can you send over the documents?'},
    {'sender': 'Diana', 'snippet': 'Lunch tomorrow? Let me know!'},
    {'sender': 'Edward', 'snippet': 'Thanks for the help with the project!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(title: 'Messages'),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(messages[index]
                    ['sender']![0]), // First letter of sender's name
              ),
              title: Text(messages[index]['sender']!),
              subtitle: Text(messages[index]['snippet']!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Action when tapping on a message
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Message from ${messages[index]['sender']}'),
                    content: Text(messages[index]['snippet']!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
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
