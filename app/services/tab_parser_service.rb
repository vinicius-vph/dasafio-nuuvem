class TabParserService
  def initialize(file)
    @file = File.open(file.tempfile)
  end

  def process
    tab_parsed = []
    @file.each_line do |tab_content|
      header_line = 'purchaser name'
      next if tab_content.match?(header_line)

      tab_item = tab_content.chomp.split(/\t/)

      tab_parsed << { purchaser_id: purchaser(tab_item[0]), item_id: item(tab_item[1]), item_price: tab_item[2],
                      purchase_count: tab_item[3].to_i, merchant_id: merchant(tab_item[5], tab_item[4]) }
    end

    tab_parsed
  end

  private

  def purchaser(tab_item)
    registred_purchaser = Purchaser.find_by(name: tab_item)
    registred_purchaser ? registred_purchaser.id : Purchaser.create!(name: tab_item).id
  end

  def item(tab_item)
    registred_item = Item.find_by(description: tab_item)
    registred_item ? registred_item.id : Item.create!(description: tab_item).id
  end

  def merchant(name, address)
    registred_merchant = Merchant.find_by(name: name)
    registred_merchant ? registred_merchant.id : Merchant.create!(name: name, address: address).id
  end
end
