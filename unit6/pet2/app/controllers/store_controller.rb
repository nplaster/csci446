class StoreController < ApplicationController
  include CurrentConsider
  before_action :set_consider
  def index
    @animals = Animal.order(:name)
  end
end
