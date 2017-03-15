class SettingsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def index
    @settings = Setting.all
  end

  def show
    @setting = Setting.find(params[:id])
  end

  def new
    @setting = Setting.new
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to settings_path
    else
      render 'edit'
    end
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(setting_paramss)
      redirect_to settings_path
    else
      render 'edit'
    end
  end

    def destroy
      @setting = Setting.find(params[:id])
      @setting.destroy
      redirect_to settings_path
    end

  protected

  def setting_params
    params.require(:setting).permit(:key, :value, :description)
  end

  end

