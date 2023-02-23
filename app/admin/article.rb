ActiveAdmin.register Article do
    permit_params :title, :body

  index as: ActiveAdmin::Views::IndexAsTable do
    selectable_column

    # column "Title" do |post|
    #     link_to post.title, admin_post_path(post)
    # end

    id_column
    column :image_title
    column"My Custom Title", :title
    column :body
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  index as: :grid, default: true do |article|
    link_to image_tag('http://thewowstyle.com/wp-content/uploads/2015/01/Free-Wallpaper-Nature-Scenes.jpg'), admin_article_path(article)
  end

  filter :title
  filter :body
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
    end
    f.actions
  end
  
end