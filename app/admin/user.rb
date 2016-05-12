ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :name, :avatar, :password, :password_confirmation, :bio
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :email
filter :name

controller do
  
  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
  end
end

index do
  selectable_column
  id_column
  column "User Avatar" do |user|
    image_tag(user.avatar.url, size: "100x100", alt: user.avatar.identifier)
  end
  column :name
  column :email
  column :created_at
  actions
end

show  do |user|
  tabs do
    tab 'User Details' do
      attributes_table do
        row :id
        row "Avatar" do
          image_tag(user.avatar.url, alt: user.avatar.identifier) if user.avatar
        end
        row :name
        row :email
        row :bio
        row :created_at
        row :updated_at
      end
    end
  end
end


form do |f|
  f.inputs "User Details" do
    f.input :email
    f.input :name
    f.input :avatar, as: :file, hint: image_tag(f.object.avatar_url, id: "img-preview", alt: "Avatar Image", width: "400", height: "300"), input_html: { onchange: "show_image_preview(this)"}
    f.input :bio
    f.input :password
    f.input :password_confirmation
  end
  f.actions
end

end
