# アプリケーション名
ApoInfo

# アプリケーション概要と制作背景
チームでの営業活動を支援する、アポイント管理・情報共有を一つにまとめたアプリです。
前職で法人営業を行っていた際に、営業活動状況を逐一口頭で上司や同僚に報告するという慣習があり、それが一目見て済むようになるアプリというコンセプトで考えました。
報告後には、アドバイスや指示を受けることが多かったので、コミュニケーションが可能になる機能を実装しています。

# 本番環境
・URL

ログイン情報（テスト用）
・Eメール：test@gmail.com
・パスワード：test1234

# 機能一覧
・ユーザー登録、ログイン機能（devise）
・アポイント管理機能（active_hash）
・顧客プロフィール管理機能
・コメント機能
・既読機能付きチャット機能（Ajax）
・検索機能
・エラーメッセージの日本語化対応（rails-i18n）

# 非機能一覧
・各モデルの単体テスト（rspec-rails,factory_bot_rails）
・静的コード解析（rubocop）

# 使用技術
## バックエンド
Ruby,Ruby on rails

## フロントエンド
HTML,CSS,Javascript,Ajax

## データベース
MySQL,SequelPro

## インフラ
AWS(EC2),Capistrano

## Webサーバ
Nginx

## アプリケーションサーバ
unicorn

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## コード解析
Rubocop

## エディタ
VSCode

# DB設計
## usersテーブル
| Column             | Type   | Options     |
| ------             | ----   | -------     |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |

### Association
- has_many :appointments
- has_many :comments

## appointmentsテーブル
| Column      | Type       | Options                        |
| ------      | ----       | -------                        |
| title       | string     | null: false                    |
| company     | string     | null: false                    |
| customer    | string     | null: false                    |
| date        | date       | null: false                    |
| place       | string     | null: false                    |
| purpose     | text       | null: false                    |
| relation_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :profiles

## commentsテーブル
| Column      | Type       | Options                        |
| ------      | ----       | -------                        |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| appointment | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :appointment

## profilesテーブル
| Column              | Type       | Options                        |
| ------              | ----       | -------                        |
| customer_name       | string     | null: false                    |
| customer_occupation | string     | null: false                    |
| position            | string     |                                |
| note                | text       |                                |
| appointment         | references | null: false, foreign_key: true |

### Association
- belongs_to :appointment