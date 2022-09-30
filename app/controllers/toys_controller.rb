class ToysController < ApplicationController
  rescue_from(ActiveRecord::RecordNotFound, with: :resp_not_found)
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toys.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render(jon: toy, status: :accepted)
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end
  def resp_not_found
		render(json: {error: "We could not find what you are looking for"}, status: :not_found)
	end
end
