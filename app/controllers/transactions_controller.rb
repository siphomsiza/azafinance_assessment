class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show]
  before_action :parse_request, only: [:create]

  def index
    render json: Transaction.all.as_json(:except => [:updated_at])
  end

  def create
     @transaction = Transaction.new
     @transaction.assign_attributes(@json['transaction'])
     if @transaction.save
       render json: @transaction, status: 201
     else
       render json: { errors: @transaction.errors }, status: 500
     end
  end

  def show
    render json: @transaction.as_json(:except => [:updated_at])
  end

  private
   def find_transaction
     begin
       @transaction = Transaction.find(params[:id])
     rescue
       render json:  {error:{type: "DataException" ,message: "no data" ,code:	302}}
     end
   end

   def parse_request
     @json = JSON.parse(request.body.read)
   end

end
