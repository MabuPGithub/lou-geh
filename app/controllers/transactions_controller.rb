class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end

    def show
        @transaction = Transaction.find(params[:id])
    end

    def new
        @transaction = Transaction.new
        @customers = Customer.all
        @items = Item.all
    end

    def create
        @transaction = Transaction.new(transaction_params)

        if @transaction.save
            redirect_to '/transactions'
        else
            render :new
        end
    end

    private
        def transaction_params
            params.require(:transaction).permit(:product_description, :quantity, :cost, :customer_name)
        end
end
