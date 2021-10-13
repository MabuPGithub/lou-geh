class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
        @supplier = Supplier.all
    end

    def create
        @item = Item.new(item_params)

        if @item.save
            redirect_to @item
        else
            render :new
        end
    end

    def edit
        @item = Item.find(params[:id])
        @supplier = Supplier.all
    end

    def update
        @item = Item.find(params[:id])

        if @item.update(item_params)
            redirect_to @item
        else
            render :edit
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy

        redirect_to '/items'
    end

    private
        def item_params
            params.require(:item).permit(:product_description, :quantity, :cost, :delivered_by)
        end
end
