class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    user = User.find(params[:user_id])
    lists = user.lists

    render json: lists
  end

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)

    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy

    render json: {}, status: :no_content

   rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end