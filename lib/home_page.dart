import 'package:flutter/material.dart';
import 'package:quiz_app/botao_alternativa.dart';
import 'package:quiz_app/controlador_quiz.dart';
import 'botao_acao.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ControladorQuiz controladorQuiz = ControladorQuiz();

  void _selecionarAlternativa(String alternativa) {
    setState(() {
      controladorQuiz.selecionarAlternativa(alternativa);
    });
  }

  void _proximaPergunta() {
    setState(() {
      controladorQuiz.acao();
    });
  }

  @override
  Widget build(BuildContext context) {
    final questao = controladorQuiz.questaoAtual;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Color.fromARGB(255, 1, 26, 138),
      ),
      body: controladorQuiz.verResultados
          ? Container(
              decoration:
                  new BoxDecoration(color: Color.fromARGB(255, 1, 26, 138)),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 217, 0)),
                          "Resultado"),
                      Text(
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 241, 241, 241)),
                          "ACERTOS: ${controladorQuiz.acertos} ERROS: ${controladorQuiz.erros}"),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 35, 150, 0),
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Colors.amber,
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: Text('Jogar Novamente'),
                        onPressed: () {
                          setState(() {
                            controladorQuiz.reiniciarJogo();
                            controladorQuiz.acao();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(
              decoration:
                  new BoxDecoration(color: Color.fromARGB(255, 1, 26, 138)),
              padding: EdgeInsets.all(50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 255, 217, 0)),
                        "Questão"),
                    Text(
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 247, 255)),
                        "${controladorQuiz.indiceQuestaoAtual}/${controladorQuiz.quantidadeTotalQuestoes}"),
                    Divider(thickness: 5),
                    Text(
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        questao.enunciado),
                    Divider(thickness: 5),
                    SizedBox(height: 10),
                    ...controladorQuiz.questaoAtual.alternativas.map(
                      (alternativa) {
                        return BotaoAlternativa(
                          alternativa: alternativa,
                          acao: _selecionarAlternativa,
                          selecionada: controladorQuiz.alternativaSelecionada ==
                              alternativa,
                          acertou: controladorQuiz.acertouResposta,
                          respondeu: controladorQuiz.respondeuPergunta,
                        );
                      },
                    ),
                    controladorQuiz.status != StatusQuiz.AGUARDAR
                        ? BotaoAcao(
                            texto: controladorQuiz.acabou
                                ? "Resultados"
                                : controladorQuiz.selecionouAlternativa
                                    ? "Responder"
                                    : "Próxima pergunta",
                            acao: _proximaPergunta,
                          )
                        : SizedBox(
                            height: 100,
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
