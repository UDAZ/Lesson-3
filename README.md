# README

# Lesson-3 fav&comme 

# コメント機能

# ①モデル作成
rails g model BookComment comment:text user_id:integer book_id:integer

# ②モデルの関連付け
user.rbとbook.rbに
has_many :book_comments, dependent: :destroy

book_comment.rbに
belongs_to :user
belongs_to :book

# ③コメント用のコントローラーを作成
rails g controller BookComments
createとdestroyアクションを作成

# ④ルーティングの作成
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end