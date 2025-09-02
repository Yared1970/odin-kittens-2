# app/controllers/kittens_controller.rb
class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]

  # GET /kittens
  def index
    @kittens = Kitten.all
  end

  # GET /kittens/:id
  def show
    # @kitten is ready
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # POST /kittens
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Congratulations! You just added a new kitten named #{@kitten.name}."
      redirect_to @kitten
    else
      flash.now[:alert] = "There were errors in your form. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  # GET /kittens/:id/edit
  def edit
    # @kitten is ready
  end

  # PATCH/PUT /kittens/:id
  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten #{@kitten.name} was updated successfully."
      redirect_to @kitten
    else
      flash.now[:alert] = "Your update could not be saved. Please correct the errors and try again."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kittens/:id
  def destroy
    name = @kitten.name
    @kitten.destroy
    flash[:notice] = "Kitten #{name} has been deleted."
    redirect_to kittens_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
