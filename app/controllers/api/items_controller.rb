class Api::ItemsController < ApiController
  before_action :authenticated?
  before_action :authorized?, only: [:update, :destroy]

  def index
    list = List.find(params[:list_id])
    items = list.items

    render json: items
  end

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])

    if item.update(item_params)
      render json: item
    else
     render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item)
  end

  def authorized?
    item = Item.find(params[:id])
    unless @current_user == item.list.user
      render json: { error: "Not Authorized", status: 403 }, status: 403
    end
  end
end 