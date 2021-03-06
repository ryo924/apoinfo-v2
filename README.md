# アプリケーション名
ApoInfo

# アプリケーション概要と制作背景
・チームでの営業活動を支援する、アポイント管理・情報共有を一つにまとめたアプリです。  
・前職で法人営業を行っていた際に、営業活動状況を逐一口頭で上司や同僚に報告するという慣習があり、それが一目見て済むようになるアプリというコンセプトで考えました。  
・報告後には、アドバイスや指示を受けることが多かったので、コミュニケーションが可能になる機能も併せて実装しています。  
  
![トップページ見本](https://user-images.githubusercontent.com/72852755/101456427-5da64000-3977-11eb-8f31-eded5179f9be.png)  

# 本番環境
http://54.168.59.129/  
  
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

# 非機能一覧
・各モデルの単体テスト（rspec-rails,factory_bot_rails）  
・静的コード解析（rubocop）  
・エラーメッセージの日本語化対応（rails-i18n）  

# 使用技術／開発環境
・Ruby,Ruby on rails  
・HTML,CSS,Javascript,Ajax  
・MySQL,SequelPro  
・AWS(EC2),Capistrano  
・Nginx  
・Unicorn  
・GitHub, GitHubDesktop  
・RSpec  
・Rubocop  
・VSCode  

# DB設計
<img width="899" alt="ER図" src="https://user-images.githubusercontent.com/72852755/101456328-3ea7ae00-3977-11eb-8a51-5dea479235a5.png">  

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

## chatsテーブル
| Column  | Type    | Options  |
| ------  | ----    | -------  |
| content | text    |          |
| checked | boolean |          |