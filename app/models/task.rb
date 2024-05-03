class Task < ApplicationRecord
  has_many :board_tasks
  has_many :boards, through: :board_tasks
  belongs_to :state
  belongs_to :informer, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
end
