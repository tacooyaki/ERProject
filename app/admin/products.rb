ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  permit_params :name, :description, :price, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all
    end
    f.actions
  end
end
