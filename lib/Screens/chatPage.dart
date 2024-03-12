//class Ai
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:managment/Screens/consts.dart';


class chatPage extends StatefulWidget {
  
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {

  final openAi = OpenAI.instance.build(
    token: OPENAI_API_KEY, baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 10,),

    ),
    enableLog: true,
  );

 ChatUser user = ChatUser(
    id: '1',
    firstName: 'Kaider',
    lastName: 'Nguyen',
  );
   ChatUser fintechBot = ChatUser(
    id: '2',
    firstName: 'Fintech',
    lastName: 'Ai',
  );

  List<ChatMessage> messages =  <ChatMessage>[];
  List<ChatUser> typingUser = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: const Color.fromRGBO(0, 166, 126, 1),

    ) ,
    body: DashChat(
        currentUser: user,
        typingUsers: typingUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.green,
          containerColor: Color.fromRGBO(0, 166, 126, 1),
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
          },
          messages: messages,
          ),
      );
    
  }
  Future<void> getChatResponse (ChatMessage m) async{
    setState(() {
      messages.insert(0, m);
      typingUser.add(fintechBot);
    });
    List<Messages> messagesHistory = messages.reversed.map((m){
      if(m.user == user)
      {
        return Messages(role:Role.user, content:m.text);
      }
      else 
      {
        return Messages(role:Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(model: GptTurbo0301ChatModel(), messages: messagesHistory, maxToken: 500,);
    final respone = await openAi.onChatCompletion(request: request);
    for (var element in respone!.choices )
    {
      if( element.message != null){
        setState(() {
          messages.insert(0, ChatMessage(user: fintechBot, createdAt:DateTime.now(), text: element.message!.content));
        });
      }
    }
    setState(() {
      typingUser.remove(fintechBot);
    });
  }
}