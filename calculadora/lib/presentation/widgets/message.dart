import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final double score;
  final double minimunScore;

  static const String _disAprovedMessage = "¡ OH NO HAS REPROBADO :( !";
  static const String _minScoreMessage = "NOTA MÍNIMA PARA APROBAR";

  static const String _aprovedMessage = "¡ FELICIDADES HAS APROBADO :D !";

  static const TextStyle _commonTextstyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  static const TextStyle _scoreTextstyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold );

  const Message({super.key, required this.score, required this.minimunScore});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final confettiController = ConfettiController();

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  Widget _aprovedBlockMessage() {
    if (mounted) {
      confettiController.play();
      Future.delayed(const Duration(seconds: 5), () => confettiController.stop());      
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              Message._aprovedMessage,
              textAlign: TextAlign.center,
              style: Message._commonTextstyle,
            ),
            Text(
              '${widget.score} de 100',
              textAlign: TextAlign.center,
              style: Message._scoreTextstyle,
            )
          ],
        ),
        ConfettiWidget(
          confettiController: confettiController,
          blastDirection: -1.5708,
          emissionFrequency: 0.05,
          numberOfParticles: 5,
        ),
      ],
    );
  }

  Widget _disAprovedBlockMessage() {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              Message._disAprovedMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '${widget.score} de 100',
              textAlign: TextAlign.center,
              style: Message._scoreTextstyle,
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              Message._minScoreMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '${widget.minimunScore}',
              textAlign: TextAlign.center,
              style: Message._scoreTextstyle,
            ),
          ],
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
            color: widget.score >= 60 ? const Color(0xFF004448) : const Color(0xFFac2c15),
            border: Border.all(width: 0, color: Colors.transparent)),
        child: widget.score >= 60
            ? _aprovedBlockMessage()
            : _disAprovedBlockMessage());
  }
}
