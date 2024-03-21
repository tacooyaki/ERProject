ActiveAdmin.register StaticPage do
  permit_params :title, :slug, :content

  form do |f|
    f.inputs 'Static Page Details' do
      f.input :title
      f.input :slug
      f.input :content, as: :text
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :content do |static_page|
        static_page.content.body.to_s.html_safe
      end
    end
  end
end