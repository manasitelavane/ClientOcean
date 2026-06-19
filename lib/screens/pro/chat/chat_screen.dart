import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String customerName;
  final String initials;
  final Color avatarColor;

  const ChatScreen({
    super.key,
    this.customerName = 'Priya Sharma',
    this.initials = 'PS',
    this.avatarColor = const Color(0xFF4158D0),
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _msgController = TextEditingController();
  final List<_Message> _messages = [
    _Message(
        text: "Hi! I've uploaded my PAN and Form 16.",
        isMe: false,
        time: '09:40'),
    _Message(
        text: "Got it, thanks. I'll review and confirm shortly.",
        isMe: true,
        time: '09:42'),
    _Message(text: 'Sure, thank you!', isMe: false, time: '09:43'),
  ];

  void _send() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Message(text: text, isMe: true, time: 'Now'));
      _msgController.clear();
    });
  }

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
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 16, color: Color(0xFF0D0D2B)),
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: widget.avatarColor, shape: BoxShape.circle),
              child: Center(
                child: Text(widget.initials,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.customerName,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D0D2B))),
                const Text('Customer',
                    style:
                        TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length + 1,
              itemBuilder: (ctx, i) {
                if (i == 0) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text('Today',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w500)),
                    ),
                  );
                }
                final msg = _messages[i - 1];
                return _MessageBubble(message: msg);
              },
            ),
          ),
          // Input bar
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Color(0xFFF3F4F6))),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.attach_file,
                      color: Color(0xFF9CA3AF), size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: const InputDecoration(
                      hintText: 'Message...',
                      hintStyle:
                          TextStyle(color: Color(0xFFD1D5DB), fontSize: 15),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontSize: 15, color: Color(0xFF0D0D2B)),
                  ),
                ),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.send_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isMe;
  final String time;
  const _Message({required this.text, required this.isMe, required this.time});
}

class _MessageBubble extends StatelessWidget {
  final _Message message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: message.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: message.isMe
                        ? const LinearGradient(colors: [
                            Color(0xFF4DD0E1),
                            Color(0xFF4158D0),
                          ])
                        : null,
                    color: message.isMe ? null : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: message.isMe
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                      bottomRight: message.isMe
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: message.isMe
                          ? Colors.white
                          : const Color(0xFF0D0D2B),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: const TextStyle(
                      fontSize: 11, color: Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
