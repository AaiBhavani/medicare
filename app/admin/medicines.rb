ActiveAdmin.register Medicine do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
  permit_params :name,:product,:company,:code,:packing,:unit,:sgst,:cgst,:igst,:rate_margin,:fixed_disc,:category,:mrp,:pur
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :quantity, :m_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :name
    column :mrp
    column :pur
    actions
  end

  show do |medicine|
    attributes_table_for(medicine) do
      row :name
      row :product
      row :company
      row :code
      row :packing
      row :unit
      row :sgst
      row :cgst
      row :igst
      row :rate_margin
      row :fixed_disc
      row :category
      row :mrp
      row :pur
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :product
      f.input :company
      f.input :code
      f.input :packing
      f.input :unit
      f.input :sgst
      f.input :cgst
      f.input :igst
      f.input :rate_margin
      f.input :fixed_disc
      f.input :category
      f.input :mrp
      f.input :pur
    end
    f.actions
  end  
end
