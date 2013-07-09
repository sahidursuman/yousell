class SalesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :edit
  
  def new
    # If there's an incomplete sale in the DB, load it. Else, create a new one
    @sale = Sale.not_complete.count > 0 ? Sale.not_complete.last : Sale.create
    hobo_new
  end
  
  def update
    hobo_update do
      flash[:notice] = I18n.t("sale.messages.create.success")
      redirect_to '/'
    end
  end
  
  def index
    hobo_index Sale.complete
  end
  
end
