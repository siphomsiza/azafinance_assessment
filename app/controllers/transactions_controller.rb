class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show]
  before_action :parse_request, only: [:create]

  def index
    render json: Transaction.all.as_json(:except => [:updated_at])
  end

  def create
    begin
     @transaction = Transaction.new
     @transaction.assign_attributes(params_permit(@json['transaction']))
     if @transaction.save
       render json: @transaction, status: 201
     else
       render json: { errors: @transaction.errors }, status: 500
     end
   rescue => e
     render json:  {error:{type: "DataException" ,message: "no data" ,code:	302}}
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

   def params_permit(params)
     params.require(:transaction).permit(:subject,:amount,:customer_id,:currency_code,
                                         :currency_symbol,:output_currency_code,
                                         :output_currency_symbol,:output_amount)
   end

   def parse_request
     begin
       @json = JSON.parse(request.body.read)
     rescue => e
       render json:  {error:{type: "JSON::ParserError" ,message: "error" ,code:	302}}
     end
   end

end
