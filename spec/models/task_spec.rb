require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:valid) do
    task.valid?
  end

  context '正常系' do
    let(:task) { build(:task) }

    it '保存に成功' do
      expect(task).to be_valid
    end
  end

  describe 'バリデーション' do
    describe 'タスクの名前' do
      context '空のとき' do
        let(:task) { build(:task, name: '') }

        it '名前は必須となる' do
          valid
          expect(task.errors.full_messages).to include('タスク名を入力してください')
        end
      end

      context '100文字以上のとき' do
        let(:task) { build(:task, name: 'a' * 101) }

        it '名前は100字以内となる' do
          valid
          expect(task.errors.full_messages).to include('タスク名は100文字以内で入力してください')
        end
      end
    end

    describe 'タスクの詳細' do
      context '空のとき' do
        let(:task) { build(:task, content: '') }

        it '詳細は必須となる' do
          valid
          expect(task.errors.full_messages).to include('タスク詳細を入力してください')
        end
      end

      context '500文字以上のとき' do
        let(:task) { build(:task, content: 'a' * 501) }

        it '詳細は500字以内となる' do
          valid
          expect(task.errors.full_messages).to include('タスク詳細は500文字以内で入力してください')
        end
      end
    end
  end
end
