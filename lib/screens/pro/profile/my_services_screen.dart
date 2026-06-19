import 'package:flutter/material.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  final List<_ServiceItem> _services = [
    _ServiceItem(
        name: 'Income Tax Filing',
        bookings: '1,240',
        price: '1,499',
        isActive: true),
    _ServiceItem(
        name: 'GST Registration',
        bookings: '860',
        price: '2,999',
        isActive: true),
    _ServiceItem(
        name: 'Company Audit',
        bookings: '210',
        price: '',
        isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F4FF),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 16, color: Color(0xFF0D0D2B)),
            ),
          ),
        ),
        title: const Text('My services',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D0D2B))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.add,
                    color: Color(0xFF0D0D2B), size: 20),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Toggle the services you offer and set your own pricing.',
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _services.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (ctx, i) {
                  final s = _services[i];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(s.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF0D0D2B))),
                                    const SizedBox(height: 4),
                                    Text(
                                        '${s.bookings} booked on platform',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF9CA3AF))),
                                  ],
                                ),
                              ),
                              Switch(
                                value: s.isActive,
                                onChanged: (v) =>
                                    setState(() => s.isActive = v),
                                activeTrackColor: const Color(0xFF4158D0),
                                activeThumbColor: Colors.white,
                                inactiveTrackColor: const Color(0xFFD1D5DB),
                                inactiveThumbColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        if (s.isActive) ...[
                          const Divider(height: 1, color: Color(0xFFF3F4F6)),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16, 12, 16, 16),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Your price',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF9CA3AF))),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.currency_rupee,
                                          size: 14,
                                          color: Color(0xFF374151)),
                                      const SizedBox(width: 2),
                                      Text(
                                        s.price,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF0D0D2B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceItem {
  String name, bookings, price;
  bool isActive;
  _ServiceItem({
    required this.name,
    required this.bookings,
    required this.price,
    required this.isActive,
  });
}
