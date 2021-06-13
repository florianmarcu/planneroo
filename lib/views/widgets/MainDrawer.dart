import 'package:flutter/material.dart';
import 'package:planneroo/services/authentication.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFAED4BD)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "Planneroo",
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(child: Container(),),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Sign Out"
            ),
            onPressed: () async{
              await AuthService.instance().signOut();
            },
          ),
          SizedBox(
            height: 40,
          )
        ],
      )
    );
  }
}