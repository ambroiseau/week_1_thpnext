# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all
    end

    def update
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      @item = Item.find(params[:id])
      puts @item
      @item.update(has_discount: true)
      puts @item[:discount_percentage]
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      puts "OLÉ OLÉ OLÉ"
      redirect_to administration_items_path
    end
  end
end
