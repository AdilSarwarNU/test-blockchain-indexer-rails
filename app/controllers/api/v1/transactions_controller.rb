class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :find_transaction, only: [:comments, :show]

  def index
    @transactions = Transaction.query_parameters(params[:q]).desc_created_at.page(params[:page]).per(params[:per_page])
    @total = Transaction.query_parameters(params[:q]).count
    render :index
  end

  def new
    @transaction = Transaction.new
  end

  def show
    render json: {message: @transaction ? "Transaction detail found successfully" : "Transaction not found", result: @transaction}
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction
    else
      render json: {errors: @transaction.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def comments
    @comments = Comment.where(transaction_id: params[:id])
    render json: @comments
  end

  private

  def find_transaction
    @transaction = Transaction.find_by_id(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {errors: 'Transaction not found'}, status: :not_found
  end

  def transaction_params
    params.permit(:block_number, :time_stamp, :hash, :nonce, :blockHash, :transaction_index, :from, :to, :gas, :gas_price, :is_error,
                  :txreceipt_status, :input, :contract_address, :cumulative_gas_used, :gas_used, :confirmations, :value)
  end

  def comment_params
    params.require(:comment).permit(:body, :transaction_id)
  end
end
