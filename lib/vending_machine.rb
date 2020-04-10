class VendingMachine
  require_relative 'drink'

  attr_reader :total, :receivable_money

  def initialize
    @total = 0
    @receivable_money = [10, 50, 100, 500, 1000]
    @drink_stock = {}
    @earnings = 0
    5.times { stock Drink.cola}
  end

  #投入可能なお金を判別する
  def insert(money)
    if @receivable_money.include?(money)
      @total += money
      "お金が投入されました"
    else
      money
    end
  end

  #合計額を表示
  def total
    @total
  end

  #返金処理
  def refund
    temp = @total.to_s
    @total = 0
    refund = temp.to_i
  end

  #ドリンクを在庫に入れる
  def stock(drink)
    unless @drink_stock.has_key?(drink.name)
      @drink_stock[drink.name] = { price: drink.price, stocks: [] }
    end
    @drink_stock[drink.name][:stocks] << drink.name
  end

  #ドリンク在庫確認
  def stock_info
    @drink_stock.map do |name, info|
      [name, { price: info[:price], stock: info[:stocks].size}]
    end
  end

  #購入可能ドリンク表示
  def purchasable_drink_names
    @drink_stock.select{|name, info|
      info[:price] <= total && info[:stocks].size > 0 }.keys
  end

  #指定ドリンクは購入可能か
  def purchasable?(drink_name)
    purchasable_drink_names.include?(drink_name)
  end

  #飲み物購入
  def purchase(drink_name)
    if purchasable?(drink_name)
      drink_price = @drink_stock[drink_name][:price]
      @earnings += drink_price
      @total -= drink_price
      @drink_stock[drink_name][:stocks].delete_at(0)
      [drink_name, refund]
    end
  end

  #売り上げ確認
  def earnings
    @earnings
  end
end

