# ステップ15: 終了期限を追加しよう

## scopeとconcernを使う

モデルにあるscopeをconcernに切り出すことでDRYに書ける。

## link_toでコントローラーにパラメーターを受け渡す

```ruby
link_to '終了期限でソートする', tasks_path(order_by: 'deadline')

class TasksController < ApplicationController
    def index
        params[:order_by] == 'deadline'
    end
end
```
