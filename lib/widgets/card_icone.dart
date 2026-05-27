import 'package:flutter/material.dart';

class CardIcone extends StatefulWidget{
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;
  final Color borda;
  final VoidCallback onPressed;

  const CardIcone({
    required this.icone, 
    required this.titulo, 
    required this.descricao, 
    required this.textoBotao,
    required this.cor, 
    required this.borda,
    required this.onPressed,
    super.key
});

  @override
  State<CardIcone> createState() => CardIconeState();
}

class CardIconeState extends State<CardIcone> {

  void chamarClique() {
    
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: widget.cor,
        borderRadius: BorderRadius.all(Radius.circular(32)),
        border: Border.all(
          color: widget.borda,
          width: 2
          ),
      ),
      height: 150,
      width: 300,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Icon(widget.icone), 
            Padding(padding: EdgeInsets.all(8)),
            Text(widget.titulo),
            Padding(padding: EdgeInsets.all(12)),
            ]
          ),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: chamarClique,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),

                child: Text(widget.textoBotao),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.descricao),
            ],
          )
        ],
      ),

    );
  }
}