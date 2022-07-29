environment "production"
bind "unix://#{Rails.root}/tmp/sockets/puma.sock" # socketの設定
daemonize 