# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all
    end

    def update
      @item = Item.find(params[:id])
      post_params = params.require(:item).permit(:discount_percentage)
      @item.update(post_params)
      redirect_to administration_items_path
      if @item[:discount_percentage].positive?
        @item.update(has_discount: true)
      else
        @item.update(has_discount: false)
      end
    end
  end
end
