import 'package:flutter/material.dart';
import 'package:ortucare/services/ai_service.dart';
import 'package:ortucare/widgets/bottom_nav.dart';
import 'package:ortucare/widgets/const.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadChatHistory();
  }

  // ==================== FUNGSI KIRIM CHAT ====================
  Future<void> _sendMessage(String prompt) async {
    setState(() {
      _messages.add({'text': prompt, 'isSender': true});
      _isLoading = true;
    });

    await ChatService.saveChatHistory(_messages);

    try {
      String reply = await ChatService.sendMessageToServer(prompt);
      setState(() {
        _messages.add({'text': reply, 'isSender': false});
      });
      await ChatService.saveChatHistory(_messages);
    } catch (e) {
      setState(() {
        _messages
            .add({'text': 'Gagal terhubung ke server.', 'isSender': false});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    _controller.clear();
  }

  // ==================== FUNGSI LOAD CHAT ====================
  Future<void> _loadChatHistory() async {
    List<Map<String, dynamic>> history = await ChatService.loadChatHistory();
    setState(() {
      _messages = history;
    });
  }

  // ==================== FUNGSI CLEAR CHAT ====================
  Future<void> _clearChat() async {
    await ChatService.clearChatHistory();
    setState(() {
      _messages.clear();
    });
  }

  // ==================== UI ====================
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              child: Image.asset('assets/bar.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi Mother",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                Text("Anam here, What do you need?",
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: _clearChat,
              tooltip: 'Clear Chat',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _chatBubble(
                  text: msg['text'],
                  isSender: msg['isSender'],
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: pinkTua),
            ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: pinkTua,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type whatever it is",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (text) {
                        if (text.isNotEmpty) _sendMessage(text);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: pinkTua,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }

  Widget _chatBubble({required String text, required bool isSender}) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? pinkMuda : pinkTua,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(isSender ? 16 : 0),
            bottomRight: Radius.circular(isSender ? 0 : 16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        constraints: BoxConstraints(maxWidth: 300),
      ),
    );
  }
}
