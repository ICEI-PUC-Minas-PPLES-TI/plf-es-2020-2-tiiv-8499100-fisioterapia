import 'package:FisioApp/contaFisioterapeuta/controller/auxiliares_Controller.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final void Function(int) pegarIndice;
  MenuLateral(this.pegarIndice);
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fichas()),
              );*/
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
              pegarIndice(6);
              //Navigator.pop(context);
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
                pegarIndice(8);
                //pegarIndice(9);
              }),
        ],
      ),
    );
  }
}
