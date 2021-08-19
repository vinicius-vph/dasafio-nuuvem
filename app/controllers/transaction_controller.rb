class TransactionController < ApplicationController
  before_action :processed_at, only: %i[create]

  def index
    @total_last_uploaded_transactions = Transaction.last_uploaded_file.total_transactions
    @total_all_time_transactions = Transaction.total_transactions
  end

  def new
    @transaction = Transaction.new
  end

  def create
    Transaction.transaction do
      file_parsed.each do |transaction|
        transaction[:processed_at] = @processed_at
        Transaction.create!(transaction)
      end
    end

    redirect_to transaction_index_path, notice: 'Importado com sucesso !'
  rescue ActiveRecord::RecordInvalid
    redirect_to root_path, alert: 'Falha ao importar o arquivo !'
  end

  private

  def uploaded_file
    params.require(:transaction).require(:tab_input)
  end

  def file_parsed
    TabParserService.new(uploaded_file).process
  end

  def processed_at
    @processed_at = Time.new
  end
end
