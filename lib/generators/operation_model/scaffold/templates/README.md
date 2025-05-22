
## Operations: アプリケーションの操作を明示的に記述するレイヤー

- このディレクトリには、ビジネスロジックや複数モデルにまたがる処理など、アプリケーション固有の「操作（Operation）」を記述したモジュールを配置します。
- サービスクラスの乱用を避け、責務と構造を明確に分離するための手法として設計されたのが、この "オペレーションモデル" です。

---

## 📌 基本ルール

- `Operations` は **必ずモジュールとして定義**します（クラスは禁止）。

```ruby
module Operations::User
  def self.promote_to_admin(user)
    # ...
  end
end
```

- **インスタンス化は禁止**：状態を持たない明示的な関数型スタイルを採用します。
- **Mix-in（include/extend）は禁止**：依存関係を避け、モジュールの独立性を保ちます。
- **モデルのクラスメソッドの代替として使用**します。
  - モデルには状態操作や単純な問い合わせだけを残します。
- **複数のモデルにまたがる処理**は必ず `Operations` に切り出してください。

---

## 📁 ディレクトリ構成例

```
app/models/operations/
├── user.rb                      # Operations::User モジュール
├── use_cases/
     └── registration.rb        # Operations::UseCases::Registration モジュール
```

---

## 💡 どういうときに Operations に切り出すか？

### ✅ Operations に書くもの

- 複数のモデルや外部APIにまたがる処理
- ビジネスルール・状態遷移を伴う手続き的な処理
- モデルやコントローラに書くと肥大化しやすい操作的ロジック
- 明確に「〜をする」と言えるユースケース（例：会員登録、退会処理、ポイント付与 など）
- モデルのクラスメソッドや複雑なインスタンスメソッドの処理は基本的に Operations に切り出す

### ✅ モデルに書くもの

- 定数
- `belongs_to`、`has_one`、`has_many`などのアソシエーション
- enumの定義
- バリデーション
- `before_save`、`after_destroy`などのコールバック
  - 複雑な処理になる場合は、コールバックの中でOperationsのメソッドを呼ぶ形にすることも検討する
- スコープ
  - 複雑な処理になる場合は、Operationsのメソッドにすることも検討する
- インスタンスメソッド
  - 複雑な処理になる場合は、インスタンスメソッドの中でOperationsのメソッドを呼ぶ、もしくはインスタンスメソッドではなくOperationsのメソッドにすることも検討する

---

## 🧭 命名規則と分類

- **操作の対象ごとに名前空間を分ける**
  -  `Operations::User`：ユーザー関連の操作
  - `Operations::UseCases::Registration`：会員登録に関する一連の操作
  - `Operations::UseCases::Purchase`：購入処理関連の操作
- **メソッド名は「何をするか」が明確に伝わるよう、動詞ベースで命名する（例: `promote_to_admin`, `reset_password`）**

```ruby
Operations::User.promote_to_admin(user)
Operations::User.reset_password(user, token)
Operations::UseCases::Registration.create_user(user_params)
```

-  **複雑な処理はネストされたモジュールに分割しても良い**
  - モジュール名とファイルパスを一致させることで、発見性を保ちます。

---

## 📘 使用例

```ruby
# 管理者権限の付与
Operations::User.promote_to_admin(user)

# パスワード再設定処理
Operations::User.reset_password(user, new_password)

# 会員登録処理
Operations::UseCases::Registration.create_user(user_params)
```

---

## 🎯 目的と利点

- コードの責務を明確に分離（モデル肥大化・サービスクラス混乱を防止）
- 「何をするか」がファイルパスとメソッド名から直感的にわかる
- テストしやすく、再利用しやすい
- 関数型スタイルで副作用を明示・限定できる

---

## 🧪 テストについて

Operations モジュールは状態を持たないため、RSpec 等のユニットテストで直接メソッドを呼び出すだけで簡単にテストできます。

```ruby
describe Operations::User do
  describe ".promote_to_admin" do
    it "grants admin role to the user" do
      user = create(:user)
      expect {
        Operations::User.promote_to_admin(user)
      }.to change { user.reload.role }.to("admin")
    end
  end
end
```

---

## 📝 補足

このディレクトリは、Railsの公式なレイヤー構造（MVC）には存在しませんが、アプリケーション規模の成長に伴って必要になる「ユースケース層」として位置づけられます。

この `Operations` 層により、ビジネスロジックとデータモデルの責務をきれいに分離し、長期的な保守性とテスト性を向上させることが目的です。
