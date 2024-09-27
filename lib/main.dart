import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

class _Tela1State extends State {
  List<Pessoa> lista = [];

  @override
  void initState() {
    super.initState();
    carregarLista();
  }

  Future<void> carregarLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listaString = prefs.getString('lista_pessoas');
    List<dynamic> jsonList = json.decode(listaString);
    lista = jsonList.map((json) => Pessoa.fromJson(json)).toList();
    setState(() {});
    }

  Future<void> salvarLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(lista.map((p) => p.toJson()).toList());
    await prefs.setString('lista_pessoas', jsonString);
  }

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
      salvarLista(); // Atualiza o armazenamento após a remoção
    });
  }

  void adicionarPessoa(Pessoa pessoa) {
    setState(() {
      lista.add(pessoa);
      salvarLista(); // Atualiza o armazenamento após a adição
    });
  }

  void abrirModalCadastro() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        String nome = '';
        String sobrenome = '';
        int idade = 0;
        String cpf = '';

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Sobrenome'),
                onChanged: (value) {
                  sobrenome = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  idade = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'CPF'),
                onChanged: (value) {
                  cpf = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nome.isNotEmpty && sobrenome.isNotEmpty && idade > 0 && cpf.isNotEmpty) {
                    adicionarPessoa(Pessoa(nome: nome, idade: idade, sobrenome: sobrenome, cpf: cpf));
                    Navigator.pop(context); // Fecha o modal
                  }
                },
                child: Text('Adicionar Pessoa'),
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

class Sextou extends StatelessWidget {
  final String nome;
  final String sobrenome;
  final Function() onRemove;

  const Sextou({required this.nome, required this.sobrenome, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nome',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "$sobrenome",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class Pessoa {
  String nome;
  int idade;
  String sobrenome;
  String cpf;

  Pessoa({
    required this.nome,
    required this.idade,
    required this.sobrenome,
    required this.cpf,
  });

  // Método para converter um objeto Pessoa em um mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'sobrenome': sobrenome,
      'cpf': cpf,
    };
  }

  // Método para criar um objeto Pessoa a partir de um mapa (JSON)
  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      nome: json['nome'],
      idade: json['idade'],
      sobrenome: json['sobrenome'],
      cpf: json['cpf'],
    );
  }
}
