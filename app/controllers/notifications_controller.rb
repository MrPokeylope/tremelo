class NotificationsController < ApplicationController

  def new
    notification = Notification.create(user_id: session[:user_id],
                                        content: "Why")
  end

  def destroy
  	if (!params[:id].nil?) 
  		note = Notification.find(params[:id])
  		note.destroy
  		respond_to do |format|
       format.html { redirect_to notifications_users_path, success: 'Notification deleted' }
     end
   end
 end

end
