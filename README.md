# Operation Model Scaffold

Operation Model Scaffold は、Rails アプリケーションにおける Operations レイヤーのスキャフォールドを生成するジェネレータ Gem です。
このツールを使用することで、アプリケーションのビジネスロジックを整理し、保守性と再利用性を高めることができます。

## 特徴

- `rails generate operation_model:scaffold` コマンドで、`app/models/operations/` ディレクトリとその中の `README.md` を自動生成
- Operations レイヤーの導入を簡素化し、クリーンアーキテクチャの実現をサポート
- Rails のジェネレータ機能を活用したシームレスな統合

## インストール

Gemfile に以下を追加してください：

```ruby
gem 'operation_model_scaffold', git: 'https://github.com/shu0115/operation_model_scaffold.git'
```

その後、以下のコマンドを実行してインストールします：

```bash
bundle install
```

## 使用方法

ジェネレータを実行して、Operations レイヤーのスキャフォールドを生成します：

```bash
bin/rails generate operation_model:scaffold
```

このコマンドにより、以下の構造が作成されます：

```
app/models/operations/
└── README.md
```

`README.md` には、Operations レイヤーの使用方法やベストプラクティスに関する情報を記述できます。

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE.txt) の下でライセンスされています。

## 作者

- [shu0115](https://github.com/shu0115)
