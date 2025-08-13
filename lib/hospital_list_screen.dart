import 'package:flutter/material.dart';
import 'hospital_detail_screen.dart';

class HospitalListScreen extends StatelessWidget {
  final List<Map<String, String>> hospitals = [
    {
      "name": "Cleveland Clinic Abu Dhabi",
      "location": "Abu Dhabi",
      "desc": "24/7 Emergency Services",
      "image": "https://via.placeholder.com/100"
    },
    {
      "name": "Cedars-Sinai",
      "location": "Los Angeles, CA",
      "desc": "Advanced Cardiac Care",
      "image": "https://via.placeholder.com/100"
    },
    {
      "name": "Northwestern",
      "location": "Chicago, IL",
      "desc": "Pediatric Specialties",
      "image": "https://via.placeholder.com/100"
    },
    {
      "name": "MD Anderson",
      "location": "Houston, TX",
      "desc": "Cancer Treatment Center",
      "image": "https://via.placeholder.com/100"
    },
    {
      "name": "Mass General",
      "location": "Boston, MA",
      "desc": "General Hospital",
      "image": "https://via.placeholder.com/100"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearest Hospital List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.document_scanner_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search for Hospital...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = hospitals[index]; // ✅ Define it here
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(hospital["image"]!, width: 60, fit: BoxFit.cover),
                      title: Text(hospital["name"]!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hospital["location"]!),
                          Text(hospital["desc"]!),
                        ],
                      ),
                      trailing: TextButton(
                        child: Text("View Details", style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HospitalDetailScreen(name: hospital["name"]!),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
