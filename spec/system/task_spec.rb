require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  it 'トップページにアクセス' do
    visit root_path
  end
end
