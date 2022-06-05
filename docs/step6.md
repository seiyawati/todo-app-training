# ステップ6: RuboCop を設定しよう

## rubocop

### RedundantBegin

例外処理がメソッド定義全体に対して行われる場合には begin と end を省略できる。

```ruby
def redundant
  begin
    ala
    bala
  rescue StandardError => e
    something
  end
end

def preferred
  ala
  bala
rescue StandardError => e
  something
end
```

http://blog.livedoor.jp/sasata299/archives/51338814.html

### $stderr.putsの代わりにwarnを使う

[railsの変更箇所](https://github.com/rails/rails/pull/31096)

[rubocopの変更箇所](https://github.com/rubocop/rubocop/pull/4813)

### Rails/FilePath: Prefer Rails.root.join('path/to').

上記の書き方が好ましい
```ruby
# "/" で区切った1つの文字列を渡すパターン
csv_file_path = Rails.root.join('spec/fixtures/sample.csv')

# パスの要素ごとに区切って複数の文字列を渡すパターン
csv_file_path = Rails.root.join('spec', 'fixtures', 'sample.csv')
```

```ruby
Rails.root.class
#=> Pathname

Rails.root.method(:join).source_location
#=> ["/Users/jnito/.rbenv/versions/2.6.5/lib/ruby/2.6.0/pathname.rb", 407]
```

[joinメソッドについて](https://qiita.com/jnchito/items/7393c26490b075456154)

### style/GlobalStdStream: Use $stdout instead of STDOUT.

STDOUTにログを追記していくのは、事前定義定数に再割り当てしてるのと同義のようで、インタープリターから警告が出る。よってグローバル変数 $stdout を使うほうがベター。

Enforces the use of `$stdout/$stderr/$stdin` instead of `STDOUT/STDERR/STDIN`.

### Bundler/OrderedGems

gemの順番を注意される。

`Bundler/OrderedGems: Gems should be sorted in an alphabetical order within their section of the Gemfile. Gem mysql2 should appear before rails.`

これは空行なしで連なっている物だけ反応するので、空行かコメントを加えると出なくなる。

### Style/ExpandPathArguments

```ruby
expand_path('../../config/environment', __FILE__)

# 上記ではなくて下記を使う
expand_path('../config/environment', __dir__)
```

- File.expand_path
  - 第1引数の絶対パスを返す
  - 第2引数は参照の基準となるパス

- `__FILE__`
  - 実行ファイル名を相対パスで取得する。

- `__dir__`
  - 実行ファイルのディレクトリ名を絶対パスで取得する。
