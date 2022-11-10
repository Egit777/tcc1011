// ignore_for_file: prefer_const_constructor
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tela_de_calculo/Home.dart';
import 'Database/BancoDados.dart';
import 'telaCalculo.dart';
import 'main.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

class MyTable extends StatefulWidget {
  final List<DataRow>? dadosTabela;

  @override
  const MyTable({
    required this.dadosTabela,
  });

  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test Table",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Histórico"),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
          ),
          body: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DataTable(columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'DATA',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'ENDEREÇO',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'KM ATUAL',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'KM ANTERIOR',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'VALOR ABASTECIDO',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'VALOR POR LITRO',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'LITROS ABASTECIDOS',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'KM RODADOS',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'CONSUMO POR KM',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ], rows: widget.dadosTabela!),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                        child: Text('Home'))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
