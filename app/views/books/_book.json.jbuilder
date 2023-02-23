json.extract! book, :id, :tilte, :body, :created_at, :updated_at
json.url book_url(book, format: :json)
