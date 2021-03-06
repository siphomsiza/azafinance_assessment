class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show]
  before_action :parse_request, only: [:create]

  def index
    render json: Transaction.all.as_json(:except => [:updated_at])
  end

  def create
    @transaction = Transaction.new
    @transaction.assign_attributes(transaction_params)
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

   def transaction_params
      params = ActionController::Parameters.new(@json)
      params.fetch(:transaction, {}).permit(:subject,:input_amount,:customer_id,
                                            :input_currency_code,:input_currency_symbol,
                                            :output_currency_code,:output_currency_symbol,
                                            :output_amount)
   end

   def parse_request
     begin
       @json = JSON.parse(request.body.read)
     rescue => e
       render json:  {error:{type: "JSON::ParserError" ,message: "Request did not succeed: #{e.message}" ,code:	809}}
     end
   end

end
