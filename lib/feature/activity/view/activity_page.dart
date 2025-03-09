import 'package:corp_cab_app/app/providers/cab_booking_provider.dart';
import 'package:corp_cab_app/core/extensions/context_extensions.dart';
import 'package:corp_cab_app/feature/activity/component/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          'My Rides',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorPadding: const EdgeInsets.symmetric(
            horizontal: -20,
            vertical: 2,
          ), // Add padding
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

class UpcomingRidesPage extends StatefulWidget {
  const UpcomingRidesPage({super.key});

  @override
  State<UpcomingRidesPage> createState() => _UpcomingRidesPageState();
}

class _UpcomingRidesPageState extends State<UpcomingRidesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CabBookingProvider>(context, listen: false)
          .fetchUpcomingBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CabBookingProvider>(
      builder: (context, provider, child) {
        if (provider.isLoadingUpcoming) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.hasUpcomingFetchError) {
          return const Center(child: Text('Failed to load bookings'));
        }

        if (provider.upcomingBookings.isEmpty) {
          return const Center(child: Text('No upcoming rides'));
        }

        return ListView.builder(
          itemCount: provider.upcomingBookings.length,
          itemBuilder: (context, index) {
            final booking = provider.upcomingBookings[index];

            return bookingCard(
              booking: booking,
            );
          },
        );
      },
    );
  }
}

class CompletedRidesPage extends StatelessWidget {
  const CompletedRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/empty.svg', // Add your image asset here
                height: MediaQueryExtension(context).veryhighValue2x,
              ),
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
                context.goNamed('schedule-ride');
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
