import 'package:FisioApp/contaFisioterapeuta/controller/auxiliares_Controller.dart';
import 'package:FisioApp/contaFisioterapeuta/controller/fichasController.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  //final void Function(int) mudarPagina;
  //DashBoard(this.mudarPagina);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _indiceMenu = 5;
  Widget _tela;
  BuildContext tes;
  var _tituloDashBoard = 'FisioApp';

  void _alterarIndice(int indice) {
    setState(() {
      _indiceMenu = indice;

      _tela = _selecionarWidget();
    });
  }

  Widget _selecionarWidget() {
    var escolhido;
    switch (_indiceMenu) {
      case 5:
        break;
      case 6:
        escolhido = AuxiliaresController();
        Navigator.pop(context);
        break;
      case 7:
        break;
      case 8:
        Navigator.pop(context);
        break;
      default:
    }
    return escolhido;
  }

//DashBoard().ContextMenuPreviewBuilder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MenuLateral(_alterarIndice),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gustavo',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.list,
              ),
              title: Text(
                'Fichas',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FichasController()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.assignment_turned_in,
              ),
              title: Text(
                'Testes',
              ),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(
                Icons.group,
              ),
              title: Text(
                'Auxiliares',
              ),
              onTap: () {
                //_tela = AuxiliaresController();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuxiliaresController(),
                  ),
                );
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                'Configurações',
              ),
              onTap: () {},
            ),
            ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text(
                  'Sair',
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //pegarIndice(9);
                }),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          _tituloDashBoard,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Container(
        child: _tela,
      ),
    );
  }
}
