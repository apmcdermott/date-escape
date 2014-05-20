class ScenariosController < ApplicationController
  def index
    @scenarios = Scenario.all
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def new
    @scenario = Scenario.new
    @messages = Message.all
    @message_triggers = @messages.map do |message|
      message[:trigger]
    end
    @message_content = @messages.map do |message|
      message[:content]
    end
  end

  def create
    @scenario = Scenario.create(scenario_params)
    if @scenario.save
      flash[:notice] = 'Scenario successfully created'
      redirect_to root_path
    else
      flash.now[:error] = @scenario.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    @scenarios = Scenario.all
  end

  private

  def scenario_params
    params.require(:scenario).permit(:title, :is_enabled?)
  end
end
