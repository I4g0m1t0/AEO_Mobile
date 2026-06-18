# AEO_Mobile — Design-to-Code: Figma → Flutter mediado por IA

Repositório do experimento prático da disciplina **AEO: Desenvolvimento para Dispositivos Móveis** — Análise e Desenvolvimento de Sistemas, **Senac Joinville (2026/1)**, Prof. Me. Gabriel Caixeta Silva.

Este projeto dá suporte ao resumo expandido do seminário **"Impactos do Uso da Inteligência Artificial no Desenvolvimento Mobile — Prós e Contras"**, dentro da linha de pesquisa **Design-to-Code: avaliação da conversão Figma → Flutter mediada por ferramentas de IA**.

---

## Objetivo

Avaliar, de forma comparativa, a fidelidade e a qualidade do código Flutter gerado por diferentes modelos de linguagem (LLMs) ao converter **uma mesma tela de design** (login mobile, criada no Figma) em interface funcional, a partir de **um mesmo briefing e prompt**.

A pergunta central: *quão fiel ao design e quão idiomático ao Flutter é o código que cada IA produz "de primeira" — e onde elas erram?*

---

## Metodologia

1. **Artefato de entrada:** uma tela de login projetada no Figma (logo, campos de e-mail e senha com ícone de visibilidade, link "Esqueci minha senha", botão primário "Entrar", login social Google/Apple e rodapé "Cadastre-se").
2. **Prompt único e idêntico** enviado a cada modelo, exigindo: fidelidade *pixel-perfect*, `StatefulWidget` + `TextEditingController`, *touch targets* ≥ 48 px, somente widgets nativos e código pronto para colar no `main.dart`.
3. **Três execuções independentes**, uma por modelo, cada uma em sua própria pasta/projeto Flutter.
4. **Comparação** da saída de cada IA contra o design original, observando fidelidade visual, escolhas de widgets, acessibilidade e os erros cometidos.

> Abordagem: revisão prática / experimento comparativo controlado (mesmo input, modelos diferentes).

---

## Estrutura do repositório

```
AEO_Mobile/
├── chatgpt/    # Implementação gerada pelo GPT-5.5
├── claude/     # Implementação gerada pelo Claude Opus 4.8
├── gemini/     # Implementação gerada pelo Gemini Pro 3.1
└── README.md   
```

Cada subpasta é um projeto Flutter completo e independente, com seu próprio `README.md`, `lib/main.dart` e a captura de tela do resultado em `screenshot/print.png`.

---

## Quadro comparativo das saídas

| Critério | ChatGPT (GPT-5.5) | Gemini (Gemini Pro 3.1) | Claude (Opus 4.8) |
|---|---|---|---|
| Campo de formulário | `TextField` | `TextFormField` | `TextFormField` |
| Logo do Google | Letra **"G"** preta | Letra **"G"** vermelha | Logo **multicolorido** (CustomPainter) |
| Logo da Apple | `Icons.apple` | `Icons.apple` | `Icons.apple` |
| Gradiente na logo | Sim | Não (cor sólida) | Sim |
| Gradiente no botão | Sim | Não (cor sólida) | Sim |
| Sombra / elevação | Sim | Parcial | Sim |
| Responsividade | `maxWidth: 430` | largura cheia | largura cheia |
| `dispose()` dos controllers | Sim | Sim | Sim |
| Linhas de código (`main.dart`) | ~409 | ~348 | ~422 |

> Os valores acima refletem a saída de cada modelo neste experimento e não um ranking absoluto dos produtos.

---

## Principais observações (prós e contras)

**Prós observados**
- Todas as três IAs entregaram uma tela funcional, compilável e visualmente próxima do design em poucos segundos.
- O *boilerplate* (estrutura do `StatefulWidget`, `TextEditingController`, `InputDecoration`) foi gerado corretamente e de forma idiomática por todos os modelos.
- Boas práticas como `dispose()` dos controllers e alvos de toque adequados apareceram sem precisar de pedido explícito.

**Contras / erros observados** *(material rico para a discussão acadêmica)*
- **Logos de marca foram o ponto fraco unânime:** nenhum modelo reproduziu o **"G" colorido do Google de primeira**. O ChatGPT gerou uma letra "G" preta e o Gemini uma letra "G" vermelha; o logotipo real de 4 cores só surgiu após uma **segunda iteração** (no projeto `claude`, desenhado via `CustomPainter`).
- Houve **divergência de cores e espaçamentos** entre os modelos para o mesmo design — cada IA "chutou" valores hex e paddings ligeiramente diferentes.
- Conflitos de **versão de SDK** (`environment: sdk`) gerados pela IA podem quebrar o `pub get` em máquinas com Dart mais antigo — um erro silencioso que só aparece na hora de executar.

> Conforme a orientação do enunciado: *documentar os erros da IA costuma render as melhores discussões.* O caso do logo do Google é o exemplo central deste experimento.

---

## Como executar (qualquer uma das pastas)

Pré-requisitos: Flutter SDK instalado (`flutter --version`).

```bash
cd claude        # ou chatgpt / gemini
flutter clean
flutter pub get
flutter run      # escolha o dispositivo (Android, iOS, Chrome/Edge, Windows...)
```

> **Observação de compatibilidade:** se aparecer `version solving failed` por causa do SDK, ajuste no `pubspec.yaml` a linha `environment: sdk:` para a versão do seu Dart (ex.: `sdk: ^3.8.0`) e `flutter_lints` para uma versão compatível (ex.: `^5.0.0`), ou rode `flutter upgrade`.

---

## Equipe

- Eduardo Jhonathan Passos Neumann
- Iago Rech Tramontin

---

## Cronograma (conforme enunciado da disciplina)

| Etapa | Data |
|---|---|
| Versão pré-seminário | 24/junho |
| Apresentação (seminário) | 08/julho |
| Versão final | 15/julho |

---

## Referências

As referências completas (modelos de IA utilizados, documentação do Flutter/Dart e bibliografia de apoio) constam no **resumo expandido**, formatadas em **norma ABNT**.

---

*Trabalho acadêmico desenvolvido para fins de estudo comparativo. As marcas e logotipos citados (Google, Apple, Figma) pertencem aos seus respectivos detentores.*
