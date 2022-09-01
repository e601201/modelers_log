Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? #letter_opener
  root 'static_pages#welcome'

  namespace :admin do
    root 'dashboards#index'
    get  'login',       to: 'user_sessions#new'                      #管理者ログイン画面
    post 'login',       to: 'user_sessions#create'                   #管理者ログイン処理
    delete 'logout',    to: 'user_sessions#destroy'                  #管理者ログアウト処理
    resources :projects, except: %i[new create]                      #projects管理
    resources :workspaces, except: %i[new create]                    #workspaces管理
    resources :tasks, except: %i[new create]                         #tasks管理
    resources :news                                                  #お知らせの管理
  end

  get  'login',       to: 'user_sessions#new'                        #ユーザーログイン画面
  post 'login',       to: 'user_sessions#create'                     #ユーザーログイン処理
  delete 'logout',    to: 'user_sessions#destroy'                    #ユーザーログアウト処理
  post 'guest_login', to: 'user_sessions#guest_login'                #ゲストログイン機能
  resources :password_resets, only: %i[new create edit update]       #パスワードリセット

  namespace :template do
    resource :assembly, only: :create                                #projectのテンプレート作成
    resource :painting, only: :create                                #同上
    resource :photography, only: :create                             #同上
  end

  resources :projects do                                             #projects
    resources :tasks, except: :index do                              #tasks
      resource :status_change, only: :update, module: 'tasks'        #task_statusの変更
      resource :move_higher, only: :update, module: 'tasks'
      resource :move_lower, only: :update, module: 'tasks'
    end
    resource :status_change, only: :update, module: 'projects'       #project_statusの変更
    resource :duplications, only: :create, module: 'projects'        #projectを自身のworkspaceに複製する
    resource :preview, only: :show, module: 'projects'               #task設定時のprojectのプレビュー表示
    resources :favorites, only: %i[create destroy]                   #projectをお気に入りに追加
  end

  resources :workspaces do                                           #workspaces
    resource :profile,          only: :show, module: 'workspaces'    #workspaces/profile
    resources :notifications, only: [] do
      resource :read, only: :create                                  #通知の既読の有無
    end
    resource :relationships,    only: %i[create destroy]             #好きなwaorkspaceをお気に入りに追加
    member do
      resources :tool_set                                            #任意のworkspaceの道具一覧(workspaceのnew時に一緒にnewする)
      resources :followers,     only: :index, module: 'workspaces'   #フォロワー一覧
      resources :followings,    only: :index, module: 'workspaces'   #フォロー一覧
      resources :favorites,     only: :index, module: 'workspaces'   #お気に入り一覧
      resources :notifications, only: :index, module: 'workspaces'   #通知一覧
      resource  :owner_avatars, only: :destroy, module: 'workspaces' #アバター画像の削除
    end
  end
end