import 'package:flutter/material.dart';

class User_Data extends StatelessWidget {
  const User_Data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 29, 29, 1),
        title: Text(
          'User\'s data',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'email@gmail.com',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          DataTable(
            columnSpacing: 12,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(5.0))),
            border: TableBorder.all(color: Colors.white),
            columns: <DataColumn>[
              DataColumn(
                  label: Text(
                'Id',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Name',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Speed',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Distance',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Drowisness',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Rate',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ],
            rows: <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(
                  Text(
                    '1',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                DataCell(
                  Text(
                    'mostafa',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                DataCell(
                  Text(
                    '60',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                DataCell(
                  Text(
                    '15 m',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                DataCell(
                  Text(
                    '5 time',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                DataCell(
                  Text(
                    '70%',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
