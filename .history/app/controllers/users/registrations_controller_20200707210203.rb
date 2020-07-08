class Users::RegistrationsController < Devise::RegistrationsController

  def destroy
    resource.destroy
	Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
	resource.update(email: resource.deleted_at.to_i.to_s + '_' + resource.email.to_s)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end
end
