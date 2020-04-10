
VendingMachine
Sample implementation for TDDBC Osaka 3.0

Naming convention is taken from here.

How to use
$ irb
> require './lib/vending_machine'
> machine = VendingMachine.new
> machine.stock_info # => [[:cola, {:price=>120, :stock=>5}]]
> machine.stock Drink.redbul # => [:redbull]
> machine.stock Drink.water #=> [:water]
> machine.stock_info # => [[:cola, {:price=>120, :stock=>5}], [:redbull, {:price=>200, :stock=>1}], [:water, {:price=>100, :stock=>1}]]
> machine.insert 1 # => 1 (Not available)
> machine.insert 5 # => 5 (Not available)
> machine.insert 10 # => "お金が投入されました"
> machine.insert 50 # => "お金が投入されました"
> machine.total # => 60
> machine.refund # => 60
> machine.total # => 0
> machine.insert 100 # => "お金が投入されました"
> machine.purchasable_drink_names # => [:water]
> machine.purchasable? :water # => true
> machine.purchasable? :cola # => false
> machine.purchasable? :redbull # => false
> machine.purchase :redbull # => nil (Not purchasable)
> machine.insert 50
> machine.purchasable_drink_names # => [:cola, :water]
> machine.purchasable? :cola # => true
> machine.insert 100
> machine.purchasable_drink_names # => [:cola, :redbull, :water]
> machine.purchasable? :redbull # => true
> machine.total # => 250
> machine.purchase :redbull # => [:redbull, 50]
> machine.total # => 0
> machine.refund # => 0
> machine.earnings # => 200
> machine.stock_info # => [[:cola, {:price=>120, :stock=>5}], [:redbull, {:price=>200, :stock=>0}], [:water, {:price=>100, :stock=>1}]]
> exit