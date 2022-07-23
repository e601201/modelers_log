Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? #letter_openerの利用inDev環境
  root 'static_pages#welcome'

  namespace :admin do
    root 'dashboards#index'
    get  'login',       to: 'user_sessions#new'                      #管理者ログイン画面
    post 'login',       to: 'user_sessions#create'                   #管理者ログイン処理
    delete 'logout',    to: 'user_sessions#destroy'                  #管理者ログアウト処理
    resources :projects, except: %i[new create]                      #projects管理
    resources :workspaces, except: %i[new create]                    #workspaces管理
    resources :tasks, except: %i[new create]                         #tasks管理
  end

  scope module: :top do
    resources :hot_projects,   only: :index
    resources :hot_workspaces, only: :index
  end

  get  'login',       to: 'user_sessions#new'                        #ユーザーログイン画面
  post 'login',       to: 'user_sessions#create'                     #ユーザーログイン処理
  delete 'logout',    to: 'user_sessions#destroy'                    #ユーザーログアウト処理
  resources :password_resets, only: %i[new create edit update]       #パスワードリセット

  resources :projects do                                             #projects
    resources :tasks, except: :index                                                 #tasks
    resource :preview, only: :show, module: 'projects'               #task設定時のprojectのプレビュー表示
    resources :favorites, only: %i[create destroy]                   #projectをお気に入りに追加
    collection do
      get 'search'                                                   #projectsの検索
      resource :recent, only: :show, module: 'projects'              #projectの新規作成順
    end
  end

  resources :workspaces do                                           #workspaces_CRUD
    resource :profile,          only: :show                          #workspacesの中のprofile
    resource :relationships,    only: %i[create destroy]             #好きなwaorkspaceをお気に入りに追加
    member do
      resources :tool_set                                            #任意のworkspaceの道具一覧(workspaceのnew時に一緒にnewする)
      resources :project,       only: :index                         #プロジェクト一覧
      resources :followers,     only: :index                         #フォロワー一覧
      resources :followings,    only: :index                         #フォロー一覧
      resources :favorites,     only: :index                         #お気に入り一覧
      resource  :owner_avatars, only: :destroy, module: 'workspaces'
    end
  end
end
