class UserGroupeUsersController < ApplicationController
  before_action :set_user_groupe_user, only: [:show, :edit, :update, :destroy]

  # GET /user_groupe_users
  # GET /user_groupe_users.json
  def index
    @user_groupe_users = UserGroupeUser.all
  end

  # GET /user_groupe_users/1
  # GET /user_groupe_users/1.json
  def show
  end

  # GET /user_groupe_users/new
  def new
    @user_groupe_user = UserGroupeUser.new
    @user_groupe_user.groupe_user.build
    @user_groupe_user.user.build
  end

  # GET /user_groupe_users/1/edit
  def edit
  end

  # POST /user_groupe_users
  # POST /user_groupe_users.json
  def create
    @user_groupe_user = UserGroupeUser.new(user_groupe_user_params)

    respond_to do |format|
      if @user_groupe_user.save
        format.html {  notice: 'User groupe user was successfully created.' }
        format.json
      else
        format.html { render :new }
        format.json { render json: @user_groupe_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_groupe_users/1
  # PATCH/PUT /user_groupe_users/1.json
  def update
    respond_to do |format|
      if @user_groupe_user.update(user_groupe_user_params)
        format.html { redirect_to @user_groupe_user, notice: 'User groupe user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_groupe_user }
      else
        format.html { render :edit }
        format.json { render json: @user_groupe_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_groupe_users/1
  # DELETE /user_groupe_users/1.json
  def destroy
    @user_groupe_user.destroy
    respond_to do |format|
      format.html { redirect_to user_groupe_users_url, notice: 'User groupe user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_groupe_user
      @user_groupe_user = UserGroupeUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_groupe_user_params
      params[:user_groupe_user]
    end
end
