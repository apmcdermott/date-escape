class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @scenario_titles = Scenario.all.map do |scenario|
      scenario[:title]
    end
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      flash[:notice] = 'Message successfully created'
      redirect_to messages_path
    else
      flash.now[:error] = @message.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
    redirect_to messages_path
    @scenario_titles = Scenario.all.map do |scenario|
      scenario[:title]
    end
  end

  private

  def message_params
    params.require(:message).permit(:trigger, :content, :voice, :language)
  end
end
