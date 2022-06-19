# ステップ12: Railsのタイムゾーンを設定しよう

## Railsのタイムゾーンの設定について

Railsのタイムゾーンの設定は以下の二つがある。
- `config.time_zone`
  - Rails自体のアプリケーションの時刻の設定
- `config.active_record.default_timezone`
  - DBを読み書きする際に、DBに記録されている時間をどのタイムゾーンで読み込むかの設定
  - localeに設定するとOSのタイムゾーンを引き継ぐ

## Time.nowとTime.currentの違い

- Time.now
  - OSのタイムゾーンの結果を返す
- Time.current
  - Railsアプリケーションのタイムゾーンの結果を返す

## ActiveRecordのcreate_at

ActiveRecordのcreated_atの日時に関する表示は、config.time_zoneで設定したタイムゾーンに変換される。

## 参考記事

https://zenn.dev/ryouzi/articles/dda18594f2dbd3
