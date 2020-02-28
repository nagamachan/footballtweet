# README

# アプリ名 
  FootballTweet

# 概要
  サッカー画像投稿アプリです。
  <img width="800" alt="スクリーンショット 2020-02-25 22 59 22" src="https://user-images.githubusercontent.com/59175719/75253734-8020ff80-5822-11ea-93ec-e3f6256f7ac1.png">


# 本番環境 (デプロイ先 testアカウント&ID)
  デプロイはまだしてません

# 工夫したポイント
  1,コメント機能に非同期通信を取り入れた点
  2,インクリメンタルサーチを実装し、tweetsテーブルのtextのカラムにインデックスを貼ることで、データの検索を高速化しました。
  3,お気に入り機能の実装
  4,フラッシュメッセージの実装
  
# 使用技術
  Ruby/Ruby on Rails/JavaScript/jQuery/MySQL/Github/Visual Studio Code
  
# 課題や今後実装したい機能
  画像複数枚投稿
  マイページにアイコン設定
  SNSログイン設定
  新規会員登録時にお気に入りチームの設定


# DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

### アソシエーション

- has_many :tweets
- has_many :comments
- has_many :liked_tweets

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|------|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :commnets
- has_many :liked_users

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|tweet|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet