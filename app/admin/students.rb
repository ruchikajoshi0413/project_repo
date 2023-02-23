ActiveAdmin.register Student do

  permit_params :studentname, :section

  index do
    selectable_column
    id_column
    column :studentname
    column :section
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :studentname
  filter :section
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :studentname
      f.input :section
    end
    f.actions
  end
  
end
  

