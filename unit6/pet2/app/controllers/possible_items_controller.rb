class PossibleItemsController < ApplicationController
  include CurrentConsider
  before_action :set_consider, only: [:create]
  before_action :set_possible_item, only: [:show, :edit, :update, :destroy]

  # GET /possible_items
  # GET /possible_items.json
  def index
    @possible_items = PossibleItem.all
  end

  # GET /possible_items/1
  # GET /possible_items/1.json
  def show
  end

  # GET /possible_items/new
  def new
    @possible_item = PossibleItem.new
  end

  # GET /possible_items/1/edit
  def edit
  end

  # POST /possible_items
  # POST /possible_items.json
  def create
    animal = Animal.find(params[:animal_id])
    @possible_item = @consider.possible_items.build(animal: animal)

    respond_to do |format|
      if @possible_item.save
        format.html { redirect_to @possible_item.consider, notice: 'Possible item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @possible_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @possible_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /possible_items/1
  # PATCH/PUT /possible_items/1.json
  def update
    respond_to do |format|
      if @possible_item.update(possible_item_params)
        format.html { redirect_to @possible_item, notice: 'Possible item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @possible_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /possible_items/1
  # DELETE /possible_items/1.json
  def destroy
    @possible_item.destroy
    respond_to do |format|
      format.html { redirect_to possible_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_possible_item
      @possible_item = PossibleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def possible_item_params
      params.require(:possible_item).permit(:animal_id, :consider_id)
    end
end
