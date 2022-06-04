# ステップ7: タスクモデルを作成しよう

## limit制約

stringでは、`limit: num`でvarchar(num)が使用される。

## redo

ロールバックと再マイグレーションを一度に実行できるショートカット
```
rails db:migrate:redo
```

マイグレーションは1つ前の状態に戻せることを担保できていることが大切
redoを流して確認する！

## MassAssingment撲滅

RailsではDBの更新系処理で複数のカラムを一括で指定できる。

```ruby
Person.new(name: 'hoge', age: 24)
person.update(name: 'hoge', age: 24)
```

これをマスアサイメント機能という

Rails3までは、attr_accessibleで対策していた。

```ruby
class User < ActiveRecord::Base
  attr_accessible :name, :age
end
```

これで、nameとageしかアクセスできないようになっていた。
しかし、GitHubがこれをセキュリティホールとしたため

Rails4からController側でStrong Parametersを用いることになった。

```ruby
def create
  @person = Person.new(person_params)
  # 略
end

private

# Never trust parameters from the scary internet, only allow the white list through.
def person_params
  params.require(:person).permit(:name, :age)
end
```

マスアサイメントをわざと突破してみよう
https://qiita.com/tbpgr/items/63028f5e19a2d1617e40

