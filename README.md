# テーブル設計

## users
| Column     | Type   | Options  |
| ---------- | ------ | -------- |
| email      | string | not null |
| password   | string | not null |
| name       | string | not null |
| profile    | text   | not null |
| occupation | text   | not null |
| position   | text   | not null |

### Association
- has_many :prototypes
- has_mane :comments


## prototypes
| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| title      | string    | not null                       |
| catch_copy | string    | not null                       |
| concept    | string    | not null                       |
| user       | reference | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :users


## comments
| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| text      | text      | not null                       |
| user      | reference | null: false, foreign_key: true |
| prototype | reference | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :prototypes