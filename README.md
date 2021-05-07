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
  
# ⑤ビューの作成
①showに配置する一覧view
      <table class='table'>
        <t-body>
          <% @book.book_comments.each do |book_comment| %>　
            <tr><% unless book_comment.id.nil? %>
                <td>
                  <%= link_to user_path(book_comment.user) do %>
                    <%= attachment_image_tag(book_comment.user, :profile_image, :fill, 100, 100, fallback: "no-image-icon.jpg") %><br>
                    <%= book_comment.user.name %>
                  <% end %>
                </td>
                <td><%= book_comment.comment %></td>
                <td>
                  <% if book_comment.user == current_user %>
                    <div class="comment-delete">
                      <%= link_to "Destroy", book_book_comment_path(book_comment.book, book_comment), method: :delete, class: "btn btn-sm btn-danger destroy_book_#{@book.id}" %>
                      </div>
                  <% end %>
                    </td>
            <% end %></tr>
          <% end %>
        </t-body>
      </table>
②indexに配置するカウントview
<td>コメント件数：<%= @book.book_comments.count %></td>
# ⑥コメントのインスタンス変数を記述

