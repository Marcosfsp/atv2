import 'package:flutter/material.dart';
import 'package:app/Sextou.dart';
import 'package:app/model/Pessoa.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Lista para Widget",
      home: Tela1(),
    );
  }
}

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State createState() => _Tela1State();
}

class _Tela1State extends State {
  List lista = [
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano2",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano3",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano2",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano3",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano2",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano3",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano2",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano3",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano2",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "fulano3",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
    Pessoa(
        nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    Pessoa(
        nome: "fulano",
        idade: 30,
        sobrenome: "sobrenome",
        cpf: "111.111.111-11"),
  ];

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Lista para Widget"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
//return Text(lista[index].nome);
          return Sextou(
            nome: lista[index].nome,
            sobrenome: lista[index].sobrenome,
            onRemove: () => removerItem(index),
          );
        },
      ),
    );
  }
}
