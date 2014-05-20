class ScenariosController < ApplicationController
  # Prohibit non-logged in users from viewin or doin stuff
  before_action :authenticate_user!, except: [:index]
  before_action :set_scenarios, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @scenarios = current_user.scenarios.order(updated_at: :desc)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def new
    @scenario = Scenario.new
    @messages = current_user.messages
    @message_triggers = @messages.map { |message|
      message[:trigger]
    }
  end

  def create
    @scenario = Scenario.create(scenario_params)
    message =  Message.where(trigger: params[:message][:trigger]).first
    @scenario.messages << message
    current_user.scenarios << @scenario
    if @scenario.save
      flash[:notice] = 'Scenario successfully created'
      redirect_to root_path
    else
      flash.now[:error] = @scenario.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @scenario = Scenario.find(params[:id])
    @messages = current_user.messages
    @message_triggers = @messages.map { |message|
      message[:trigger]
    }
  end

  def update
    scenario = Scenario.find(params[:id])
    scenario.update(scenario_params)
    redirect_to scenarios_path
  end

  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy
    redirect_to scenarios_path, notice: "You have deleted the scenario"
  end

  private

  def set_scenarios
    if user_signed_in?
      @scenarios = current_user.scenarios.find(params[:id])
    end
  end

  def scenario_params
    params.require(:scenario).permit(:title, :is_enabled?)
  end
end
