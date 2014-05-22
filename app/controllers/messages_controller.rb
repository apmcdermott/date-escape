class MessagesController < ApplicationController
  # Prohibit non-logged in users from viewin or doin stuff
  before_action :authenticate_user!, except: [:index]
  before_action :set_messages, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @messages = current_user.messages.order(updated_at: :desc)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    current_user.messages << @message
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

  def set_messages
    if user_signed_in?
      @messages = current_user.messages.find(params[:id])
    end
  end

  def message_params
    params.require(:message).permit(:trigger, :content, :voice, :language)
  end
end
