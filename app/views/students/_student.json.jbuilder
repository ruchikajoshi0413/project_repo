json.extract! student, :id, :studentname, :section, :created_at, :updated_at
json.url student_url(student, format: :json)
