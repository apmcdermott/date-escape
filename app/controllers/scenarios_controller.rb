class ScenariosController < ApplicationController
  def index
    @scenarios = Scenario.all
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def new
    @scenario = Scenario.new
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
  end

  private

  def message
    params.require(:scenario).permit(:title, :is_enabled?)
  end
end
