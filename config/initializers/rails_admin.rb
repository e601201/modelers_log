RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.authenticate_with do
    require_login
  end
  config.current_user_method(&:current_user)
  config.parent_controller = "Admin::BaseController"

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

  end
end
