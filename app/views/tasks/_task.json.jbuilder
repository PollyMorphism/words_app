json.extract! task, :id, :name, :user_id, :points, :repeatable, :created_at, :updated_at
json.url task_url(task, format: :json)
