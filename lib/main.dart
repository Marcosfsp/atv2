import 'Sextou.dart';
import 'model/Pessoa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _Tela1State extends State<Tela1> {
  List<Pessoa> lista = [
    Pessoa(nome: "Victor", idade: 37, sobrenome: "Alves", cpf: "000.000.000-00"),
    // Adicione mais pessoas conforme necessário
  ];

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  void abrirModalCadastro() {
    final nomeController = TextEditingController();
    final sobrenomeController = TextEditingController();
    final idadeController = TextEditingController();
    final cpfController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: sobrenomeController,
                decoration: InputDecoration(labelText: 'Sobrenome'),
              ),
              TextField(
                controller: idadeController,
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
              ),
              ElevatedButton(
                onPressed: () {
                  final novoCadastro = Pessoa(
                    nome: nomeController.text,
                    sobrenome: sobrenomeController.text,
                    idade: int.tryParse(idadeController.text) ?? 0,
                    cpf: cpfController.text,
                  );

                  setState(() {
                    lista.add(novoCadastro);
                  });

                  Navigator.pop(context);
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        );
      },
    );
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
          return Sextou(
            nome: lista[index].nome,
            sobrenome: lista[index].sobrenome,
            onRemove: () => removerItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirModalCadastro,
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
