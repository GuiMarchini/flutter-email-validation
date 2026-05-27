import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';

class HomeScreen extends StatelessWidget {
 
@override
Widget build(BuildContext context){
  final cores = Theme.of(context).colorScheme;
  
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'RUMO',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 68, 149, 255),
          letterSpacing: 10,
        )
      ),
      backgroundColor: cores.secondary,
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
      child: Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcone(
                icone: Icons.home,
                 titulo: "Início",
                  descricao: "Explorar",
                   textoBotao: "INICIO",
                    cor: const Color.fromARGB(255, 231, 244, 255),
                     borda: Colors.blue,
                       onPressed: (){}
                        
              ),
            ]
          ),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcone(
                icone: Icons.person,
                 titulo: "Perfil",
                  descricao:"Personalizar seu usuário",
                   textoBotao: "PERFIL",
                    cor: const Color.fromARGB(255, 255, 239, 239),
                     borda: Colors.red,
                     onPressed: () {},
              )
            ]
            
          ),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcone(
                icone: Icons.star,
                 titulo: "Favoritos",
                  descricao: "Salve o que você gosta",
                   textoBotao: "FAVORITOS",
                    cor:  const Color.fromARGB(255, 255, 243, 249),
                     borda:  const Color.fromARGB(255, 222, 54, 244),
                     onPressed: () {},
              )
            ]
            
          ),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcone(
                icone: Icons.settings,
                 titulo: "Configurações",
                  descricao: "Preferências do APP",
                   textoBotao:  "CONFIGURAÇÕES",
                    cor: const Color.fromARGB(255, 233, 255, 242),
                     borda: const Color.fromARGB(255, 66, 165, 0),
                     onPressed: () {},
              )
            ]
            
          ),
        ],
      ),
    )
  );
}
}
