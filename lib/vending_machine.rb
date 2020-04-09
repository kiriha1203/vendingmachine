class VendingMachine

  attr_reader :total, :receivable_money

  def initialize
    @total = 0
    @receivable_money = [10, 50, 100, 500, 1000]
  end

  #投入可能なお金を判別する
  def insert(money)
    if @receivable_money.include?(money)
      @total += money
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
end
