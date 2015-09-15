class GroupeUsersController < ApplicationController

# GET /groupe_users
# GET /groupe_users.xml
def index
  @groupe_users = GroupeUser.all
end

# GET /groupe_users/1
# GET /groupe_users/1.xml
def show
  @groupe_user = GroupeUser.find(params[:id])

end
# GET /groupe_users/1
# GET /groupe_users/1.xml
def edit
  @groupe_user=GroupeUser.find(params[:id])
end

# GET /groupe_users/new
# GET /groupe_users/new.xml
def new
  @groupe_user = GroupeUser.new
  @groupe_user.users.create(user: current_user)
end
# GET /groupe_users/1
# GET /groupe_users/1.xml
def create
  @groupe_user=GroupeUser.new(groupe_user_param)

  respond_to do |format|
    if @groupe_user.save
      format.html { redirect_to mesapps_url(current_user),:notice => 'GroupeUser was successfully created.' }
      format.js { render :action => 'mesapps', :status => :created, :location => @user }
    else
      format.html { redirect_to mesapps_url(current_user), :notice => 'Create GroupeUser was failed.' }
      format.js { render :action => @groupe_user.errors, :status => :unprocessable_entity }
    end
  end
end
# PUT /groupe_users/1
# PUT /groupe_users/1.xml
def update
  @groupe_user = GroupeUser.find(params[:id])
  #@app.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
  respond_to do |format|
    if @groupe_user.update_attributes(groupe_user_params)
        format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully updated' }
        format.json { render :action => "show", :status => :updated, :location => @groupe_user }
        format.js
      else
        format.html { redirect_to edit_groupe_user_path(@groupe_user) }
        format.json { render :action => @groupe_user.errors.full_messages, :status => :unprocessable_entity}
        format.js
      end
  end
end

# DELETE /groupe_users/1
# DELETE /groupe_users/1.xml
def destroy
  @groupe_user = GroupeUser.find(params[:id])
  if @groupe_user.destroy then
    respond_to do |format|
      format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully deleted'}
      format.js
    end
  end

end

private
  def groupe_user_param
    params.require(:groupe_user).permit(:nom, user_groupe_users_attributes:[:id,:groupe_user_id,:user_id,:_destroy])
    #params[:id]
  end

end
