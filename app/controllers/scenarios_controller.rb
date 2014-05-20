class ScenariosController < ApplicationController
  def index
    @scenarios = Scenario.all.order(updated_at: :desc)
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def new
    @scenario = Scenario.new
    @messages = Message.all
    @message_triggers = Message.all.map { |message|
      message[:trigger]
    }
  end

  def create
    @scenario = Scenario.create(scenario_params)
    message =  Message.where(trigger: params[:message][:trigger]).first
    @scenario.messages << message
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

  def scenario_params
    params.require(:scenario).permit(:title, :is_enabled?)
  end
end
