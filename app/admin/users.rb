ActiveAdmin.register User do
  # Menu
  menu priority: 2, label: "Users"

  # Permits
  permit_params :email, :name, :password, :password_confirmation

  # Index page
  index do
    selectable_column
    id_column
    column :name
    column :email
    column "Orders" do |user|
      ul do
        user.orders.each do |order|
          li do
            span "Order ##{order.id}: "
            span number_to_currency(order.total), class: 'strong'
            ul do
              order.order_items.each do |item|
                li "#{item.product.name} (#{item.quantity}x) - #{number_to_currency(item.unit_price)}"
              end
            end
          end
        end
      end
    end
    actions
  end

  # Filters
  filter :name
  filter :email

  # Form config
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # Show config
  show do
    attributes_table do
      row :name
      row :email
    end
    active_admin_comments
  end
end
