class Api::ListsController < ApiController
  # Ctrl for the lists
  before_action :authenticated?

  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end

  def create
    list = current_user.lists.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
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
    params.require(:list).permit(:name, :private)
  end
end
