require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  it 'タスク新規作成' do
    visit root_path
    expect {
      click_link '新規作成'
      fill_in '名前', with: '川本聖也'
      fill_in '詳細', with: 'テストです。'
      click_button '作成'

      expect(page).to have_content 'タスクを追加に成功しました。'
      expect(page).to have_content '川本聖也'
      expect(page).to have_content 'テストです。'
    }.to change { Task.count }.by(1)
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
