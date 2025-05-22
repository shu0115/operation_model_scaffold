# Operation Model Scaffold

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.txt)

**Operation Model Scaffold** は、Rails アプリケーションにおける **Operations レイヤー** のScaffoldを生成するジェネレータ Gem です。

このツールを使用することで、ビジネスロジックの責務を明確に分離し、保守性と再利用性を高めるためのアーキテクチャ構築をサポートします。

---

## 📌 背景

Rails では、サービスクラスやモデルが肥大化しやすく、ビジネスロジックの所在が曖昧になることがあります。

**Operation Model Scaffold** は、`Operations` レイヤーを導入することで「操作（Operation）」をアプリケーションの構造として明示的に表現できるようにし、以下のような効果をもたらします：

- ドメインロジックの見通しが良くなる
- 関心の分離（Separation of Concerns）が明確になる
- テストしやすくなる

---

## ✨ 特徴

- `rails generate operation_model:scaffold` コマンドで `app/models/operations/` とその中の `README.md` を自動生成
- Operationsレイヤーの導入を簡素化し、クリーンアーキテクチャをサポート
- Rails のジェネレータ機能を活用した軽量かつ柔軟な統合

---

## 📦 インストール

Gemfile に以下を追加：

```ruby
gem 'operation_model_scaffold', git: 'https://github.com/shu0115/operation_model_scaffold.git'
```

インストール：

```bash
bundle install
```

---

## 🚀 使用方法

以下のジェネレータを実行：

```bash
bin/rails generate operation_model:scaffold
```

生成される構造：

```
app/models/operations/
└── README.md     # Operations レイヤーの導入方針を記述するテンプレート
```

このテンプレートファイルは、開発チーム内でOperationsの利用方法や命名規則などをドキュメント化するために活用できます。

---

## 📄 ライセンス

このプロジェクトは [MIT License](LICENSE.txt) のもとで公開されています。

---

## 👤 作者

- [@shu0115](https://github.com/shu0115)
