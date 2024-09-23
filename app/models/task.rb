class Task < ApplicationRecord
  enum status: { undone: 0, done: 10 }
  enum priority: { regular: 0, medium: 10, extra: 20 }
end
