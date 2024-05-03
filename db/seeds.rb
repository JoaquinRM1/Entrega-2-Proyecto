# Crear usuarios
User.create!(username: "user1", email: "user1@example.com", password: "password", account_type: 1)
User.create!(username: "user2", email: "user2@example.com", password: "password", account_type: 1)
User.create!(username: "user3", email: "user3@example.com", password: "password", account_type: 1)

# puts "User ids: #{User.pluck(:id)}"

# Crear tableros
boards = []
3.times do |i|
  board = Board.create!(board_name: "Board #{i + 1}")
  boards << board

  # Crear estados para cada tablero
  board.states.create!(state_name: "Technology")
  board.states.create!(state_name: "Politics")
  board.states.create!(state_name: "Environment")
  board.states.create!(state_name: "Healthcare")

  # Crear tareas en cada tablero
  5.times do |k|
    task = Task.new(
      board_id: board.id,
      state_id: board.states.first.id,
      title: "Task #{k + 1} for #{board.board_name}",
      description: "Description for Task #{k + 1}",
      informer_id: User.pluck(:id).sample,
      assignee_id: User.pluck(:id).sample,
      status: ["pending", "completed", "in_progress"].sample,
      priority: rand(1..5)
    )

    task.save!
  end
end
