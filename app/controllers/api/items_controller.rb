class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    list = List.find(params[:list_id])
    items = list.items
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

  private

  def item_params
    params.require(:item).permit(:item)
  end
end 