# ステップ8: タスクを閲覧・登録・更新・削除できるようにしよう

## ステップ8-1: タスクの一覧画面、詳細画面を作成しましょう

### config.file_watcherとは？

ファイルの変更を検知するための設定です。

ActiveSupportとは、Railsの拡張機能をまとめたコンポーネント

- EventedFileUpdateChecker
  - ファイル内の変更イベントを検出する（デフォルト）
  - Dockerで検知できない

- FileUpdateChecker
  - ファイル全体を監視して変更を検出する
  - Dockerで検知できる

Docker内ではファイルを変更して保存という処理が行われていないため、ファイル変更のイベントが発生せず、デフォルトのEventedFileUpdateCheckeは作動しません。

## ステップ8-2: タスクの作成画面、編集画面を作成しましょう

### form_for

form_forが送信先をどのように決めているか？

コントローラーで作成したインスタンスがnewメソッドで新たに作成されて何も情報を持っていなければ自動的にcreateアクションへ、findメソッドなどで作成され、すでに情報を持っている場合はupdateアクションへ自動的に振り分けてくれる。

```ruby
def new
  @user = User.new
end
# 新規に作成したレコードなのでcreateアクションが動く

def edit
  @user = User.find(params[:id])
end
# 既存のレコードを取得しているのでupdateアクションが動く
```