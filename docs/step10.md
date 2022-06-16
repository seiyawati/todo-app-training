# ステップ10: テストを書こう

## Layout/SpaceAroundOperators

rubocopで演算子の間にスペースがないと警告された。

` Surrounding space missing for operator *.`

```ruby
# Bad
let(:task) { build(:task, name: 'a'*101) }

#Good
let(:task) { build(:task, name: 'a' * 101) }
```

## 配列+include

include マッチャを使うと、「配列に～が含まれていること」を検証することができる。

```ruby
x = [1, 2, 3]
# 1が含まれていることを検証する
expect(x).to include 1
# 1と3が含まれていることを検証する
expect(x).to include 1, 3
```

## 遅延評価される let と事前に実行される let!

以下のコードは失敗する。

Blog.firstを呼んだ時点ではまだlet(:blog)が実行されていない。そのためBlog.firstはnilを返す。
```ruby
RSpec.describe Blog do
  let(:blog) { Blog.create(title: 'RSpec必勝法', content: 'あとで書く') }
  it 'ブログの取得ができること' do
    expect(Blog.first).to eq blog
  end
```

上記の問題を回避するのには次のようなパターンがある。

before~doを使う。
```ruby
RSpec.describe Blog do
  let(:blog) { Blog.create(title: 'RSpec必勝法', content: 'あとで書く') }
  before do
    blog # ここでデータベースにレコードを保存する
  end
  it 'ブログの取得ができること' do
    expect(Blog.first).to eq blog
  end
end
```

let!を使う。  
example の実行前に let! で定義した値が作られるようになります。
```ruby
RSpec.describe Blog do
  let!(:blog) { Blog.create(title: 'RSpec必勝法', content: 'あとで書く') }
  it 'ブログの取得ができること' do
    expect(Blog.first).to eq blog
  end
end
```

## circleci上でSystem Specを実行するための環境構築

https://qiita.com/suzu12/items/808daa56a052f5c76e4b

## rubocopの警告を無視する方法

1. [ファイルの中でコメントする。](https://qiita.com/tbpgr/items/a9000c5c6fa92a46c206)

2. .rubocop.ymlの設定を行う。
