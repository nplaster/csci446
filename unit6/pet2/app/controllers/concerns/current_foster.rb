module CurrentFoster
  extend ActiveSupport::Concern
  private
  def set_foster
    @foster = Foster.find(session[:foster_id])
  rescue ActiveRecord::RecordNotFound
    @foster = Foster.create
    session[:foster_id] = @foster.id
  end
end