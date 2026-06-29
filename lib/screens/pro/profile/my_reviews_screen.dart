import 'package:flutter/material.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 8)
                        ],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My reviews',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D0D2B))),
                      Text('312 reviews',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  children: [
                    // Rating summary
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8)
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text('4.9',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF0D0D2B))),
                              Row(
                                children: List.generate(
                                    5,
                                    (i) => const Icon(Icons.star_rounded,
                                        color: Color(0xFFF59E0B), size: 16)),
                              ),
                              const SizedBox(height: 4),
                              const Text('312 reviews',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF9CA3AF))),
                            ],
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Column(
                              children: [
                                _RatingBar(stars: 5, value: 0.82),
                                _RatingBar(stars: 4, value: 0.12),
                                _RatingBar(stars: 3, value: 0.04),
                                _RatingBar(stars: 2, value: 0.01),
                                _RatingBar(stars: 1, value: 0.01),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    _ReviewCard(
                      initials: 'PS',
                      name: 'Priya Sharma',
                      timeAgo: '2 weeks ago',
                      stars: 4,
                      review:
                          'Filed my taxes in under an hour. Super clear and professional throughout.',
                    ),
                    const SizedBox(height: 12),
                    _ReviewCard(
                      initials: 'KM',
                      name: 'Karan Mehta',
                      timeAgo: '1 month ago',
                      stars: 4,
                      review:
                          'Very responsive and explained every deduction. Highly recommend.',
                    ),
                    const SizedBox(height: 12),
                    _ReviewCard(
                      initials: 'AR',
                      name: 'Anita Roy',
                      timeAgo: '2 months ago',
                      stars: 4,
                      review:
                          'Good service, slight delay but the outcome was perfect.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  final int stars;
  final double value;
  const _RatingBar({required this.stars, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$stars',
              style:
                  const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
          const SizedBox(width: 4),
          const Icon(Icons.star_rounded,
              size: 11, color: Color(0xFFF59E0B)),
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: const Color(0xFFF3F4F6),
                valueColor: const AlwaysStoppedAnimation(Color(0xFF4158D0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatefulWidget {
  final String initials, name, timeAgo, review;
  final int stars;

  const _ReviewCard({
    required this.initials,
    required this.name,
    required this.timeAgo,
    required this.review,
    required this.stars,
  });

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool _replying = false;
  final TextEditingController _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(widget.initials,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D0D2B))),
                    Row(
                      children: [
                        ...List.generate(
                            widget.stars,
                            (i) => const Icon(Icons.star_rounded,
                                size: 12, color: Color(0xFFF59E0B))),
                        ...List.generate(
                            5 - widget.stars,
                            (i) => const Icon(Icons.star_border_rounded,
                                size: 12, color: Color(0xFFD1D5DB))),
                        const SizedBox(width: 6),
                        Text(widget.timeAgo,
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFF9CA3AF))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.review,
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                  height: 1.45)),
          const SizedBox(height: 10),
          if (_replying) ...[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEEF0FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _ctrl,
                maxLines: 2,
                style: const TextStyle(fontSize: 13),
                decoration: const InputDecoration(
                  hintText: 'Write your reply...',
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _replying = false),
                  child: const Text('Cancel',
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF9CA3AF))),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => setState(() => _replying = false),
                  child: const Text('Send',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4158D0))),
                ),
              ],
            ),
          ] else
            GestureDetector(
              onTap: () => setState(() => _replying = true),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chat_bubble_outline_rounded,
                      size: 14, color: Color(0xFF4158D0)),
                  SizedBox(width: 4),
                  Text('Reply',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4158D0))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
