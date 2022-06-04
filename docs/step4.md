# ステップ4: 作りたいアプリケーションのイメージを考えよう

## 画面設計

## データ構造

Usersテーブル

Tasksテーブル

Labelesテーブル

TaskLabelesテーブル（中間テーブル）

## テーブル図

Usersテーブル
| カラム名        | データ型 | limit   | null  | default |
| --------------- | -------- | ------- | ----- | ------- |
| id              | integer  |         | false |         |
| name            | string   | 50文字  | false |         |
| email           | string   | 80文字  | false |         |
| password_digest | string   | 200文字 | false |         |
| admin           | boolean  |         | false | false   |

Tasksテーブル
| カラム名 | データ型 | limit   | null  | default |
| -------- | -------- | ------- | ----- | ------- |
| id       | integer  |         | false |         |
| user_id  | integer  |         | false |         |
| name     | string   | 100文字 | false |         |
| content  | string   | 500文字 | false |         |
| status   | integer  |         | false | 0       |
| priority | integer  |         | false | 1       |
| deadline | datetime |         | false |         |

Labelsテーブル
| カラム名 | データ型 | limit   | null  | default |
| -------- | -------- | ------- | ----- | ------- |
| id       | integer  |         | false |         |
| name     | string   | 100文字 | false |         |
| user_id  | integer  |         | false |         |

TaskLabelsテーブル
| カラム名 | データ型 | limit | null  | default |
| -------- | -------- | ----- | ----- | ------- |
| id       | integer  |       | false |         |
| task_id  | integer  |       | false |         |
| label_id | integer  |       | false |         |
