class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @chats = Chat.all.order(id: 'DESC')
  end

  def create
    chat = Chat.create(content: params[:content], checked: false)
    render json: { chat: chat }
  end

  def checked
    chat = Chat.find(params[:id])
    if chat.checked
      chat.update(checked: false)
    else
      chat.update(checked: true)
    end

    item = Chat.find(params[:id])
    render json: { chat: item }
  end
end
