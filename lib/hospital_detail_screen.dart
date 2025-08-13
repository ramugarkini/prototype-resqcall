import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetailScreen extends StatelessWidget {
  final String name;

  const HospitalDetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed Hospital View"),
        leading: BackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.document_scanner_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/OpenStreetMap_logo.svg/1200px-OpenStreetMap_logo.svg.png",
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            _buildInfoRow(Icons.medical_services, "Over 30 services"),
            _buildInfoRow(Icons.access_time, "Open 24 hours"),
            _buildInfoRow(Icons.verified_user, "Doctor Status: ", status: "Available", statusColor: Colors.green),
            _buildInfoRow(Icons.bed, "6 beds available", iconColor: Colors.green),
            _buildInfoRow(Icons.air, "4 ventilators available", iconColor: Colors.green),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                const phoneNumber = '1231';
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: phoneNumber,
                );
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch dialer')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("Call Now", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {String? status, Color? statusColor, Color? iconColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: text),
                  if (status != null)
                    TextSpan(text: " "),
                  if (status != null)
                    TextSpan(
                      text: status,
                      style: TextStyle(color: statusColor ?? Colors.green, fontWeight: FontWeight.bold),
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
