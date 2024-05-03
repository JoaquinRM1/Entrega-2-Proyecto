class Board < ApplicationRecord
  has_many :board_tasks
  has_many :tasks, through: :board_tasks
  has_many :states
end
