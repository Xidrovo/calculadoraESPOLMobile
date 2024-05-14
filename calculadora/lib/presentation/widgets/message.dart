import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final double score;
  final double minimunScore;

  static const String _disApprovedMessage = "¡OH NO, HAS REPROBADO! :(";
  static const String _minScoreMessage = "NOTA MÍNIMA PARA APROBAR";

  static const String _approvedMessage = "¡ FELICIDADES HAS APROBADO :D !";

  static const TextStyle _commonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  static const TextStyle _scoreTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

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

  @override
  Widget build(BuildContext context) {
    final bool isApproved = widget.score >= 60;
    final Color backgroundColor =
        isApproved ? const Color(0xFF004448) : const Color(0xFFac2c15);
    final double containerHeight = MediaQuery.of(context).size.height * 0.3;

    if (isApproved) {
      Future.delayed(
        const Duration(seconds: 3),
        () => confettiController.stop(),
      );
    }

    return Container(
      width: double.infinity,
      height: containerHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 0, color: Colors.transparent),
      ),
      child: isApproved
          ? _ApprovedMessage(
              widget: widget,
              confettiController: confettiController,
            )
          : _DisApprovedMessage(widget: widget),
    );
  }
}

class _DisApprovedMessage extends StatelessWidget {
  const _DisApprovedMessage({
    required this.widget,
  });

  final Message widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              Message._disApprovedMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '${widget.score} de 100',
              textAlign: TextAlign.center,
              style: Message._scoreTextStyle,
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
              style: Message._scoreTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class _ApprovedMessage extends StatelessWidget {
  const _ApprovedMessage({
    required this.widget,
    required this.confettiController,
  });

  final Message widget;
  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              Message._approvedMessage,
              textAlign: TextAlign.center,
              style: Message._commonTextStyle,
            ),
            Text(
              '${widget.score} de 100',
              textAlign: TextAlign.center,
              style: Message._scoreTextStyle,
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
}
