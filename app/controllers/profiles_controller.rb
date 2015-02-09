class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
  if params[:category].blank?
    @profiles = Profile.all
    respond_with(@profiles)
  else
      @category_id = Category.find_by(partner_role: params[:category]).id
      @profiles = Profile.where(category_id: @category_id).order("created_at DESC")
    end  
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:expertise, :seeking, :category_id, :about, :experience, :prefer_age, :equity_type, :category_id)
    end

end
