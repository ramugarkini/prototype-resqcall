import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat_screen.dart';


class EmergencyScreen extends StatelessWidget {
  final List<String> issues = ['head injury', 'broken arms', 'blood loss', 'unconscious'];
  final Set<String> selectedIssues = {'head injury', 'broken arms'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Assistance'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.document_scanner_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 10),
            CircularProgressIndicator(strokeWidth: 2),
            SizedBox(height: 8),
            Text("Detecting your location...", style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),

            // Input field
            TextField(
              decoration: InputDecoration(
                hintText: "Describe your problem here...",
                prefixIcon: Icon(Icons.edit_note_outlined),
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20),

            // Checkboxes
            ...issues.map((issue) => CheckboxListTile(
              title: Text(issue),
              value: selectedIssues.contains(issue),
              onChanged: (_) {},
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.red,
            )),

            SizedBox(height: 20),

            ElevatedButton.icon(
              icon: Icon(Icons.call),
              label: Text("CALL HELPLINE AGENT"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () async {
                final Uri phoneUri = Uri.parse('tel:1231');

                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(
                    phoneUri,
                    mode: LaunchMode.externalApplication, // ✅ Important for Android
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not open dialer')),
                  );
                }
              },
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.chat_bubble_outline),
              label: Text("CHAT WITH OUR AGENT"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
