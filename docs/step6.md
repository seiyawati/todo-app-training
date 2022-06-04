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

