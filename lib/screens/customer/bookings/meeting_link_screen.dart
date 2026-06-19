import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetingLinkScreen extends StatelessWidget {
  const MeetingLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text('Meeting link',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(Icons.videocam_outlined, color: Color(0xFF4158D0), size: 36),
                    ),
                    const SizedBox(height: 20),
                    const Text('Video consultation',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 8),
                    const Text('Shared by Rahul Kapoor · Google Meet',
                        style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
                    const SizedBox(height: 32),

                    // Link field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.link_rounded, color: Color(0xFF9CA3AF), size: 18),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text('meet.google.com/abc-defg-hij',
                                style: TextStyle(fontSize: 14, color: Color(0xFF374151))),
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(const ClipboardData(text: 'meet.google.com/abc-defg-hij'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Link copied'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF0FA),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.copy_rounded, color: Color(0xFF4158D0), size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.access_time_rounded, color: Color(0xFF4158D0), size: 18),
                          SizedBox(width: 10),
                          Text('Session starts Tue 18 Jun at 11:00 AM',
                              style: TextStyle(fontSize: 14, color: Color(0xFF374151))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.videocam_outlined, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text('Join meeting',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
