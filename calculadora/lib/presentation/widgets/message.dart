import 'package:flutter/material.dart';

class Message extends StatefulWidget {

  final double score;
  final double minimunScore;

  static const String _disAprovedMessage = "¡ OH NO HAS REPROBADO :( !";
  static const String _minScoreMessage = "NOTA MÍNIMA PARA APROBAR";
  
  static const String _aprovedMessage = "¡ FELICIDADES HAS APROBADO :D !";

  const Message({
    super.key,
    required this.score,
    required this.minimunScore
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  Text _aprovedBlockMessage() {
    return const Text(
      Message._aprovedMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white
        ),
      );
  }

  Widget _disAprovedBlockMessage() {
    return 
    const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          Message._disAprovedMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
            ),
          ),
        Text(
        Message._minScoreMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.score > 60 ? const Color(0xFF004448) : Colors.red
        ),
        child: widget.score > 60 ? _aprovedBlockMessage() : _disAprovedBlockMessage()
      );
  }
}