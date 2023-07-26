# 概要
このECサイトはDMMWEBCAMP生によるチーム開発課題です。
長野県にある洋菓子店『ながのCAKE』の通販を想定した、ECサイトを開発しました。
Railsを使って作成しましたので、参考までにご覧ください。
![image](https://github.com/TEAM-J0BS/nagano-cake/assets/131627788/aebdbaf6-bafa-43e2-8e34-4ab2e0de709a)


## 案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになりました。
InstagramのDMやメールで通販の注文を受けていましたが、
情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至りました。

# 言語とフレームワークのバージョン
- ruby 3.1.2p20
- Rails 6.1.7.3
- Bootstrap v5.2.3

## 使用したGem
```
gem 'devise'
gem 'kaminari','~> 1.2.1'
gem 'ransack'
gem 'enum_help'
```

# 実装機能
## 管理者側
- 管理者ログイン
- 会員登録されているユーザ情報の閲覧、編集、退会処理
- 商品の新規追加、編集、閲覧
- 商品ジャンルの編集
- ユーザの注文履歴閲覧、注文・製造ステータス変更

## 顧客側
- 会員登録、ログイン・ログアウト、退会
- 会員情報の編集
- 配送先の登録、編集
- カートへの追加、商品購入
- 支払い方法、配送先の指定
- 注文履歴の閲覧

## その他
- 商品検索機能
- 商品ジャンルごとの商品検索機能

# 使用方法
```
$ git clone git@github.com:TEAM-J0BS/nagano-cake.git
$ cd nagano-cake
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
$ rails s
```

- 管理者ページのログイン方法（/admin/sign_in)
管理者ページのログインに必要なメールアドレス及びパスワードは下記の通りです。
URLの後ろに/admin/sign_inをつけてください。

メールアドレス：admim@admin
パスワード:testtest

# 設計書
- [ER図](https://drive.google.com/file/d/1pV4eX7_nY90ormumqKS3L4yFc4PeEdre/view)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1l-TIjN5edAj2BdkSVeaz_53g0pN87iqvVTsDZa-BaV4/edit?usp=sharing)
- [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1L46uUmTP30s7Hj6J7GczezLJYTS6KcvSpnAZxaXLUSQ/edit?usp=sharing)
- [WBS](https://docs.google.com/spreadsheets/d/1L4CvF6bnN1E-lDh_x9n8PvipqE032XZfzJuBQZz7opM/edit?usp=sharing)

# 作成者アカウント
個人GitHubへのリンク
- [あみーご](https://github.com/jhas-hbd)
- [めめちゃん](https://github.com/spearb99)
- [もっくん](https://github.com/Ganmo3)
