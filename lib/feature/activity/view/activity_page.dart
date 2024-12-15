import 'package:corp_cab_app/feature/Home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _MyRidesPageState();
}

class _MyRidesPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My rides',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: -20, vertical: 2), // Add padding
            tabs: const [
              Tab(text: 'Upcoming Rides'),
              Tab(text: 'Completed Rides'),
            ],
          ),

      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UpcomingRidesPage(),
          CompletedRidesPage(),
        ],
      ),
    );
  }
}

class UpcomingRidesPage extends StatelessWidget {
  const UpcomingRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'UPCOMING',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/user_placeholder.png'),
              ),
              title: const Text(
                'WASEEM JAVED',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dec 15, 2024 | 3:40 PM',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                    softWrap: true, // Ensures the text wraps if necessary
                    overflow: TextOverflow.visible, // Default behavior for overflowing text
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.green, size: 16),
                      SizedBox(width: 5),
                      Text('Electronic City, Bengaluru'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.flag, color: Colors.black, size: 16),
                      SizedBox(width: 5),
                      Text('M.G. Road, Bengaluru'),
                    ],
                  ),
                ],
              ),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Pending',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedRidesPage extends StatelessWidget {
  const CompletedRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/empty.svg',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'You have not completed a ride yet!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('book-ride');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Book a ride',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

