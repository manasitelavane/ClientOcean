import 'package:flutter/material.dart';

class CustomerChatScreen extends StatefulWidget {
  const CustomerChatScreen({super.key});

  @override
  State<CustomerChatScreen> createState() => _CustomerChatScreenState();
}

class _CustomerChatScreenState extends State<CustomerChatScreen> {
  final TextEditingController _msgCtrl = TextEditingController();
  final List<_Msg> _messages = [
    _Msg(text: "Hi Priya! I've received your documents. Everything looks good.", isSent: false, time: '10:02'),
    _Msg(text: 'Great, thank you! Do I need to bring anything else?', isSent: true, time: '10:04'),
    _Msg(text: "No, that's all. See you on the 18th at 11 AM. I'll share the meet link beforehand.", isSent: false, time: '10:05'),
    _Msg(text: 'Perfect 👍', isSent: true, time: '10:06'),
  ];

  void _send() {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Msg(text: text, isSent: true, time: 'Now'));
      _msgCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF0FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('RK',
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Rahul Kapoor',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 7, color: Color(0xFF22C55E)),
                            SizedBox(width: 4),
                            Text('Online',
                                style: TextStyle(fontSize: 12, color: Color(0xFF22C55E))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF0FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.phone_outlined, color: Color(0xFF4158D0), size: 18),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: _messages.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('Today',
                            style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w500)),
                      ),
                    );
                  }
                  final msg = _messages[i - 1];
                  return _BubbleRow(msg: msg);
                },
              ),
            ),

            // Input bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.attach_file_rounded, color: Color(0xFF9CA3AF), size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _msgCtrl,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _send,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
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
}

class _Msg {
  final String text, time;
  final bool isSent;
  _Msg({required this.text, required this.isSent, required this.time});
}

class _BubbleRow extends StatelessWidget {
  final _Msg msg;
  const _BubbleRow({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: msg.isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: msg.isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.68),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                gradient: msg.isSent
                    ? const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                    : null,
                color: msg.isSent ? null : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(msg.isSent ? 16 : 4),
                  bottomRight: Radius.circular(msg.isSent ? 4 : 16),
                ),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  fontSize: 14,
                  color: msg.isSent ? Colors.white : const Color(0xFF0D0D2B),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(msg.time, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
          ],
        ),
      ),
    );
  }
}
