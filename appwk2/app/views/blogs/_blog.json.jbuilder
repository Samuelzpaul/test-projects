json.extract! blog, :id, :title, :body, :release, :subject, :genre, :created_at, :updated_at
json.url blog_url(blog, format: :json)
