import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/fonts/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message.dart';
import 'threedots.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late OpenAI? chatGPT;

  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: dotenv.env['key'],
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 600)));
    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    chatGPT?.genImgClose();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "Admin"
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    final request = CompleteText(
        prompt: message.text, model: kTextDavinci2, maxTokens: 200);

    final response =
        await chatGPT!.onCompletionStream(request: request).listen((response) {
      Vx.log(response!.choices[0].text);
      insertNewData(response.choices[0].text);
    });
  }

  void insertNewData(String response) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "Chatbot",
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: InputDecoration.collapsed(
                hintText: "Write your message",
                hintStyle: GoogleFonts.secularOne(textStyle: softnormal)),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: kmaincolor,
        centerTitle: true,
        title: Text(
          'Orderinsta',
          style: GoogleFonts.secularOne(textStyle: boldstyle, color: maincolor),
        ),
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return _messages[index];
                  })),
          if (_isTyping) const ThreeDots(),
          const Divider(
            height: 1,
            color: kmaincolor,
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 204, 227, 240)),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
}
