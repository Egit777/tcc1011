import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/ClienteModel.dart';

class BancoDados {
  BancoDados(); //construtor

  static criarBanco() async {
    final caminhoBancoDados =
        await getDatabasesPath(); //capturaram local onde fica os dbs do celular!
    final localBancoDados = join(caminhoBancoDados, "gasosa.db");

    var db = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersao) {
        String sqlcomando =
            "CREATE TABLE clientes( id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT, nomePosto TEXT, kmAnterior REAL, kmAtual REAL, precoLitro REAL, precoAbastecido REAL, quantidadeLitros REAL, kmRodado REAL, precoKm REAL )";
        db.execute(sqlcomando);
      },
    );
    return db;
  }

  static inserirnoBanco(ClienteModel cliente) async {
    Database db = await BancoDados.criarBanco();
    String sqlcomando =
        "INSERT INTO clientes (data, nomePosto, kmAnterior, kmAtual, precoLitro, precoAbastecido, quantidadeLitros, kmRodado, precoKm) "
        " VALUES (' ${cliente.data} ', ' ${cliente.nomePosto} ', ' ${cliente.kmAnterior} ', ' ${cliente.kmAtual}', ' ${cliente.precoLitro} ', ${cliente.precoAbastecido}, ' ${cliente.quantidadeLitros} ', ' ${cliente.kmRodado}' , ' ${cliente.precoKm}');"; //comando sql para adicionar clientes em tal coluna e tal valores!
    var a = await db.execute(sqlcomando);
    List<Map> list = await db.rawQuery('SELECT * FROM clientes');
    print(list);
  }
}
