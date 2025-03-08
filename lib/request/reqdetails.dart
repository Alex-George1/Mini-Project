import 'package:flutter/material.dart';
import '../styles/styles.dart';

class ReqDetailsPage extends StatelessWidget {
  const ReqDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Request details stored as a JSON-like Map
    final Map<String, dynamic> requestDetails = {
      "title": "Grocery Pickup",
      "description": "Buy groceries from the nearby store and deliver them.",
      "created": "25.02.25, 10:15 AM",
      "endTime": "25.02.25, 12:00 PM",
      "amount": "500 ₹",
      "status": "Waiting for volunteer",
    };

    return Scaffold(
      backgroundColor: Styles.darkPurple, // Set background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title Section (Top One-Third)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text("Request Details", style: Styles.titleStyle),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: BackButton(
                      color: Styles.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Description Container
                  buildInfoContainer(
                    requestDetails["title"],
                    requestDetails["description"],
                  ),

                  const SizedBox(height: 10),

                  // Created Time
                  buildInfoContainer("Request Created", requestDetails["created"]),

                  const SizedBox(height: 10),

                  // End Time
                  buildInfoContainer("Request End Time", requestDetails["endTime"]),

                  const SizedBox(height: 10),

                  // Amount
                  buildInfoContainer("Amount", requestDetails["amount"]),

                  const SizedBox(height: 10),

                  // Status Container
                  buildInfoContainer(
                    "Status",
                    requestDetails["status"],
                    isStatus: true, // Apply status-specific styling
                  ),

                  const SizedBox(height: 10),

                  // Cancel Request Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                      onPressed: () {
                        showConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Styles.offWhite, width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.cancel, color: Colors.white, size: 26),
                          const SizedBox(width: 8),
                          const Text(
                            "Cancel Request",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build info container dynamically
  Widget buildInfoContainer(String title, String value, {bool isStatus = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Styles.mildPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "$title: $value",
        style: isStatus
            ? Styles.bodyStyle.copyWith(
                color: Colors.orange[600],
                fontWeight: FontWeight.bold,
              )
            : Styles.bodyStyle,
      ),
    );
  }
}

// Confirmation Dialog Function
void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Styles.mildPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          "Confirm Cancellation",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        content: const Text(
          "Are you sure you want to cancel this request?",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Styles.lightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Do Not Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Cancel Request",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
