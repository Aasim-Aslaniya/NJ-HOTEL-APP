import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/bottom_navigation.dart';
import 'package:fl_chart/fl_chart.dart';


class DashboardCategory {
  final String title;
  final IconData icon;
  final String number; 
  final Color color;

  DashboardCategory({
    required this.title,
    required this.icon,
    required this.number,
    required this.color,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5D4037); 
    const Color backgroundColor = Color(0xFFFFF8E1); 
    const Color cardColor = Colors.white;

    final List<DashboardCategory> categories = [
      DashboardCategory(title: 'Total Rooms', icon: Icons.bed, number: '45', color: Colors.blue),
      DashboardCategory(title: 'Booked', icon: Icons.book_online, number: '32', color: Colors.green),
      DashboardCategory(title: 'Available', icon: Icons.meeting_room, number: '1', color: Colors.orange),
      DashboardCategory(title: 'Booking Request', icon: Icons.pending_actions, number: '4', color: Colors.purple),
      DashboardCategory(title: 'To Clean', icon: Icons.cleaning_services, number: '8', color: Colors.teal),
      DashboardCategory(title: 'Maintenance', icon: Icons.handyman, number: '4', color: Colors.redAccent),
      DashboardCategory(title: 'Complaints', icon: Icons.warning_amber, number: '2', color: Colors.red),
      DashboardCategory(title: 'Contact Customer', icon: Icons.support_agent, number: '4', color: Colors.amber),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: const Text(
            "Admin Dashboard",
            style: TextStyle(color: backgroundColor, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          elevation: 0,
          actions: const [
            Icon(Icons.notifications_outlined, color: backgroundColor, size: 24),
            SizedBox(width: 20),
            CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 16,
              child: Icon(Icons.person, color: primaryColor, size: 23),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: backgroundColor,
                padding: const EdgeInsets.fromLTRB(17, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome back, Admin",
                      style: TextStyle(
                        color: Color.fromARGB(255, 70, 47, 40),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Here is today's summary",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.26, 
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start, 
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: categories[index].color.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                categories[index].icon,
                                color: categories[index].color,
                                size: 24,
                              ),
                            ),
                            const Spacer(), 
                            Text(
                              categories[index].number,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              categories[index].title,
                              style: TextStyle(
                                color: primaryColor.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
       bottomNavigationBar: const bottomNavigation(),
      ),
    );
  }
}