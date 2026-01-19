import 'package:flutter/material.dart';

class bottomNavigation extends StatefulWidget{
  const bottomNavigation({super.key});
  
   
  @override
  State<bottomNavigation> createState() => createBottomNavigation();
}
class createBottomNavigation extends State <bottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5D4037); 
    const Color backgroundColor = Color(0xFFFFF8E1); 
    const Color cardColor = Colors.white;
    return Container(
      height: 75,
      child: BottomNavigationBar(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed ,
      selectedItemColor: backgroundColor,
      unselectedItemColor: backgroundColor.withOpacity(0.5),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.room), label: "Rooms"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Attendance"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Bookings"),
        
      ],
    ), 
    );
    
  }

}