# Operation Model Scaffold

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.txt)

**Operation Model Scaffold** は、Rails アプリケーションにおける **Operations レイヤー** の Scaffold を生成するジェネレータ Gem です。

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

- `bin/rails generate operation_model:scaffold` コマンドで `app/models/operations/` を自動生成
- `README.md` や `utility.rb` などのベースファイルを生成
- `app/models/` 配下にある全モデルに対応する Operations モジュールを自動生成
- `application_record.rb` や `utility.rb` など、特定ファイルは自動生成対象から除外

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

このコマンドにより、以下のような構造が作成されます：

```
app/models/operations/
├── README.md                   # Operations レイヤーのガイドライン
├── user.rb                     # Operations::User モジュール（app/models/user.rb に対応）
├── post.rb                     # Operations::Post モジュール（app/models/post.rb に対応）
└── use_cases/
    └── utility.rb              # 共通ユースケース向けユーティリティ
```

※ `application_record.rb` や `utility.rb` といった特殊用途のモデルは自動生成の対象外です。

---

## 📄 ライセンス

このプロジェクトは [MIT License](LICENSE.txt) のもとで公開されています。

---

## 👤 作者

- [@shu0115](https://github.com/shu0115)
