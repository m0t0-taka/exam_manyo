require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        # task = FactoryBot.create(:task, task_name: 'manyo')
        visit new_task_path
        # binding.irb
        # current_path
        # Task.count
        # page.html
        fill_in 'task_task_name', with: 'manyo'
        fill_in 'task_details', with: 'manyokadai'
        click_on 'Create Task'
        expect(page).to have_content 'manyo'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        # binding.irb
        # current_path
        # Task.count
        # page.html
        expect(page).to have_content 'manyo'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit task_path(task.id)
        current_path
        Task.count
        page.html
        expect(page).to have_content 'manyo'
      end
    end
  end
end