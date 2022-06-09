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

## ステップ8-3: タスクを削除できるようにしましょう

### link_to

show, update, destroyアクションの場合にオブジェクト名だけで指定

```ruby
<%= link_to 'Show Page', @blog %>
<%= link_to 'Update Page', @blog, :method => :put %>
<%= link_to 'Destroy Page', @blog, :method => :delete %>
```

`task_path(@task) => @task`と省略できる。

## renderとredirect_toとの違い


```ruby
#　これは render実施るrenderを実行している。
def index
  @tasks = Task.all
end

# これはなぜ失敗したときrenderを指定しているのか？
# rednerはアクション名と同じ名前のビューをレスポンスとして返すから
# では成功したときredirect_toしている理由は？
# データが更新されるため、再度HTTPリクエストする必要がある。
def create
  @task = Task.new(task_params)
  if @task.save
    flash[:success] = t('create_task_success')
    redirect_to root_url
  else
    flash[:danger] = t('create_task_failure')
    render 'new'
  end
end
```

- render
  - controller -> view

- redirect_to
  - controller -> url -> route -> controller -> view

上記のcreateメソッドだと、タスクの作成に失敗したことのエラーを表示するだけならデータの更新もなくHTTPリクエストする必要がないけれど、タスクの作成に成功して一覧ページに飛ぶならデータの更新を反映させる必要があるので、redierect_toを使っている。
