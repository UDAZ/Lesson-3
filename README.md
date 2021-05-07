# README

# Lesson-3 fav&comme 

# コメント機能

# ①モデル作成
rails g model BookComment comment:text user_id:integer book_id:integer

# ②モデルの関連付け
user.rbとbook.rbに
has_many :book_comments, dependent: :destory

book_comment.rbに
belongs_to :user
belongs_to :book