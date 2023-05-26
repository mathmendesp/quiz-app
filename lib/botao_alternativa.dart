import 'package:flutter/material.dart';
import 'controlador_quiz.dart';

class BotaoAlternativa extends StatelessWidget {
  final String alternativa;
  final Function acao;
  final bool selecionada;
  final bool acertou;
  final bool respondeu;

  BotaoAlternativa({
    super.key,
    required this.alternativa,
    required this.acao,
    required this.selecionada,
    required this.acertou,
    required this.respondeu,
  });

  @override
  Widget build(BuildContext context) {
    ControladorQuiz controladorQuiz = ControladorQuiz();

    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            style: selecionada && respondeu
                ? acertou
                    ? ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 138, 11),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(
                            color: selecionada ? Colors.amber : Colors.white,
                            width: 3.0,
                          ),
                        ),
                      )
                    : ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 151, 0, 0),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(
                            color: selecionada ? Colors.amber : Colors.white,
                            width: 3.0,
                          ),
                        ),
                      )
                : ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        color: selecionada ? Colors.amber : Colors.white,
                        width: 3.0,
                      ),
                    ),
                  ),
            onPressed: () {
              acao(alternativa);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(alternativa),
                selecionada && respondeu
                    ? Expanded(
                        child: acertou
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                      )
                    : Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
