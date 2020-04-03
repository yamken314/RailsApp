Rails.application.routes.draw do
  post "users/create" => "users#create"#ユーザー登録データベース保存
  get "signup" => "users#new"#ユーザー登録画面
  get "users/index" => "users#index"#ユーザー一覧
  get "users/:id" => "users#show"#ユーザー詳細
  get 'posts/index' => "posts#index"#投稿一覧のルーティング
  get "posts/new" => "posts#new"#新規投稿のルーティング
  get "posts/:id" => "posts#show"#投稿詳細のルーティング。urlに:idを入れ数字を受け取れるようにする
  post "posts/create" => "posts#create"#新規投稿のデータベース保存のルーティング
  get "posts/:id/edit" => "posts#edit"#編集のルーティング
  post "posts/:id/update" => "posts#update"#編集後の上書き
  post "posts/:id/destroy" => "posts#destroy"#編集削除
  get "/"=> "home#top"#トップページのルーティング
  get 'about'=> "home#about"#aboutのルーティング
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  