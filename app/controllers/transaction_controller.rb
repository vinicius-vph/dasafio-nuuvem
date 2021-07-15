class TransactionController < ApplicationController
  def create
    @transaction = []

    tab_file.each do |tab|
      transaction = Transaction.new
      transaction.purchaser_name = tab[:purchaser_name]
      transaction.item_description = tab[:item_description]
      transaction.item_price = tab[:item_price]
      transaction.purchase_count = tab[:purchase_count]
      transaction.merchant_address = tab[:merchant_address]
      transaction.merchant_name = tab[:merchant_name]
      transaction.save
      # @transaction << transaction.id
      @transaction << transaction
    end

    if @transaction.count.eql?(tab_file.count)
      redirect_to transaction_results_path(count: @transaction.count), notice: 'Importado com sucesso !'
    else

      render root_path, alert: 'Falha ao importar o arquivo !'
    end
    @set_upload = @transaction.size
  end

  def results
    # transações totais
    total_merchant_names = []
    total_merchant_names_and_values = []
    @transactions_total = []
    @finded_transactions = Transaction.order(id: :asc)

    @finded_transactions.each do |transaction|
      total_merchant_names << transaction.merchant_name
      total_merchant_names_and_values << { transaction.merchant_name => transaction.item_price * transaction.purchase_count }
    end

    total_merchant_names.uniq.each do |merchant_name|
      sale_total = []

      total_merchant_names_and_values.map do |transactions_value|
        sale_total << transactions_value[merchant_name]
      end

      @transactions_total << [merchant_name, sale_total.compact.sum.truncate(2)]
    end

    # transações ultimo upload
    last_upload_merchant_names = []
    last_upload_merchant_names_and_values = []
    @transactions_last_upload = []

    @last_upload = @finded_transactions.order(id: :asc).last(params[:count].to_i)

    @last_upload.each do |last_transaction|
      last_upload_merchant_names << last_transaction.merchant_name
      last_upload_merchant_names_and_values << { last_transaction.merchant_name => last_transaction.item_price * last_transaction.purchase_count }
    end

    last_upload_merchant_names.uniq.each do |last_merchant_name|
      sale_total = []

      last_upload_merchant_names_and_values.map do |last_transactions_value|
        sale_total << last_transactions_value[last_merchant_name]
      end

      @transactions_last_upload << [last_merchant_name, sale_total.compact.sum.truncate(2)]
    end

    @transactions_total
    @transactions_last_upload
  end

  private

  def uploaded_file
    params.require(:tab_input).tempfile.path
  end

  def tab_file
    tab_content = []
    tab_parsed = []

    file = File.read(uploaded_file)

    file.each_line do |transaction|
      tab_content << transaction.chomp.split(/\t/) unless transaction.include?('purchaser name')
    end

    tab_content.map do |index|
      tab_hash = {}

      tab_hash.store(:purchaser_name, index[0])
      tab_hash.store(:item_description, index[1])
      tab_hash.store(:item_price, index[2])
      tab_hash.store(:purchase_count, index[3].to_i)
      tab_hash.store(:merchant_address, index[4])
      tab_hash.store(:merchant_name, index[5])

      tab_parsed << tab_hash
    end

    tab_parsed
  end
end
