json.extract! post, :id, :title, :work_stage, :description, :published, :published_at, :user_id, :project_id, :created_at, :updated_at
json.url post_url(post, format: :json)
