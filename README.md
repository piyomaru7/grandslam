# テーブル設計
 
## users

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|user_name         |string |null: false, unique: true|
|nickname          |string |                         |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|position          |string |                         |
|pitching          |string |                         |
|age               |string |                         |
|area              |string |                         |
|year              |integer|                         | 
|fan               |string |                         |
|text              |text   |                         |

### Association

- has_many :posts
- has_many :comments
- has_many :favorites
- has_many :follower
- has_many :followed

## posts

|Column|Type      |Options                       |
|------|----------|------------------------------|
|text  |text      |null: false                   |
|user  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many   :comments
- has_many   :favorites

## comments

|Column|Type      |Options                       |
|------|----------|------------------------------|
|text  |text      |null: false                   |
|user  |references|null: false, foreign_key: true|
|post  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post

## relationships

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|follower|references|null: false, foreign_key: true|
|followed|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## favorites

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key: true|
|post    |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post

