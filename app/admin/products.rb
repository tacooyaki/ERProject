ActiveAdmin.register Product do

  # Alters automatic image filters causing conflicts with ActiveAdmin/Ransack
  filter :name
  filter :price
  filter :category, as: :select, collection: -> { Category.all }

  remove_filter :images

  permit_params :name, :description, :price, :category_id, :is_on_sale, images: []

  # Ensures that existing images with a product are not removed when updating a product
  controller do
    def update
      @product = Product.find(params[:id])
      @product.update(permitted_params[:product].except(:images))

      if params[:product][:images].present?
        @product.images.attach(params[:product][:images])
      end

      if @product.save
        redirect_to [:admin, @product], notice: "Product was successfully updated."
      else
        render :edit, notice: "Unable to update product."
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :is_on_sale
    actions
  end

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all
      f.input :is_on_sale, as: :boolean, label: 'On Sale'
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :category
      row :images do |product|
        div do
          product.images.each do |image| # Ignore error message
            span do
              image_tag url_for(image)
            end
          end
        end
      end
    end
  end
end
