Gestão de Escolas
=
Software para gestão de escolas; controle de alunos, turmas e professores.

[Veja o projeto no Pivotal Tracker](https://www.pivotaltracker.com/projects/773269)

Especificação Original
-
- Cadastrar os alunos, as turmas, os professores e as matérias que cada professor pode ministrar.

- No cadastro de turmas, informar quais as matérias que essa turma tem (ex: portugues e matemática) e qual o professor está ministrando cada uma (João em Português e Maria em Matemática).

- Relatório que mostre todos os alunos agrupados por turma e quais professores ministram quais matérias em cada turma; filtrar por turma e por professor.

- Tudo com testes unitários e aceitação.

Decisões técnicas e motivos
-
- Português é a língua do projeto (classes, variáveis, tabelas, arquivos), porque nada foi especificado em relação a i18n.

- Professores e alunos serão armazenados na mesma tabela (*Pessoas*), para que possam ter dados comuns sem repetir colunas nas tabelas (nome, idade, sexo, documentos, etc.).

- A tabela *Pessoas* terá uma coluna para indicar o tipo da pessoa (professor ou aluno), assumindo que nenhuma pessoa será professor e aluno ao mesmo tempo.