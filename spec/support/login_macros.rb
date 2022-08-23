module LoginMacros
  def login_as(user)
    visit root_path
    click_link 'ログイン画面'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'Itg43y0G'
    click_button 'ログイン'
  end
end