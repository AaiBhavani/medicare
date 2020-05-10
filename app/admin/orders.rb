ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :total,
    order_details_attributes: [:id, :medicine_id, :unit, :delivery_mode, 
                               :price_each, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.hidden_field :user_id, value: current_user.id
    f.inputs do
      f.has_many :order_details, allow_destroy: true do |details|
        details.inputs "details" do
          details.input :medicine_id, label: 'Medicine Name', as: :select, collection: Medicine.all.map{|u| ["#{u.name}, total units=(#{u.unit}), MRP per unit=(#{u.mrp})", u.id]}
          details.input :unit
          details.input :price_each, input_html: { disabled: true }
          details.input :delivery_mode
          details.input :price, input_html: { disabled: true }
        end
      end

      f.input :total, input_html: { disabled: true }
    end
    # f.inputs do
    #   f.has_many :taggings, sortable: :position, sortable_start: 1 do |t|
    #     t.input :tag
    #   end
    # end
    # f.inputs do
    #   f.has_many :comment,
    #              new_record: 'Leave Comment',
    #              allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|
    #     b.input :body
    #   end
    # end
    f.actions
  end
end
