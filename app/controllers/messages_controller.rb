class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(updated_at: :desc)
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @scenarios = Scenario.all
    @scenario_titles = @scenarios.map { |scenario|
      scenario[:title]
    }
  end

  def create
    @message = Message.create(message_params)
    scenario =  Scenario.where(title: params[:scenario][:title]).first
    @message.scenarios << scenario
    if @message.save
      flash[:notice] = 'Message successfully created'
      redirect_to messages_path
    else
      flash.now[:error] = @message.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
    @scenarios = Scenario.all
    @scenario_titles = @scenarios.map { |scenario|
      scenario[:title]
    }
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
    redirect_to messages_path
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: "You have deleted the message"
  end

  private

  def message_params
    params.require(:message).permit(:trigger, :content, :voice, :language)
  end
end
