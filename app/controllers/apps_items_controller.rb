class AppsItemsController < ApplicationController
  respond_to :html, :js
 
  def new
    current_user.organization.cloud_app.apps_items.build(params[:apps_items])
    @products = Product.all
    @apps_item = current_user.organization.cloud_app.apps_items
  end

  def create
    @user = current_user
    product = Product.find(params[:product_id])
    sleep 5 
    logger.debug "create -> product #{product.id}"
    @apps_item = @user.organization.cloud_app.apps_items.build(:product => product) || AppsItem.new(params[:apps_item])
    @apps_item.save
    respond_with( @apps_item, :layout => !request.xhr? )
  end

  def destroy
    logger.debug "testing - inside destroy"
    current_user.organization.cloud_app.apps_items.find(params[:id]).destroy
  end
end
