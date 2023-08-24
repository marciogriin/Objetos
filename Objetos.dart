import 'dart:convert';

class Dependente {
  String nome;

  Dependente(this.nome);
}

class Funcionario {
  String nome;
  List<Dependente> dependentes;

  Funcionario(this.nome) : dependentes = [];

  void adicionarDependente(Dependente dependente) {
    dependentes.add(dependente);
  }
}

class EquipeProjeto {
  String nome;
  List<Funcionario> funcionarios;

  EquipeProjeto(this.nome, this.funcionarios);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'funcionarios': funcionarios.map((funcionario) {
        return {
          'nome': funcionario.nome,
          'dependentes': funcionario.dependentes.map((dependente) {
            return {'nome': dependente.nome};
          }).toList(),
        };
      }).toList(),
    };
  }
}

void main() {
  // Criar objetos Dependentes
  final dependente1 = Dependente("Dependente 1");
  final dependente2 = Dependente("Dependente 2");

  // Criar objetos Funcionários
  final funcionario1 = Funcionario("Funcionário 1");
  final funcionario2 = Funcionario("Funcionário 2");

  // Associar Dependentes aos Funcionários
  funcionario1.adicionarDependente(dependente1);
  funcionario2.adicionarDependente(dependente2);

  // Criar uma lista de Funcionários
  final listaFuncionarios = [funcionario1, funcionario2];

  // Criar um objeto EquipeProjeto usando composição
  final equipeProjeto = EquipeProjeto("Projeto X", listaFuncionarios);

  // Imprimir o objeto EquipeProjeto em formato JSON
  final equipeProjetoJSON = jsonEncode(equipeProjeto.toJson());
  print(equipeProjetoJSON);
}
