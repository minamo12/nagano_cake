
[1mFrom:[0m /home/ec2-user/environment/nagano_cake/app/controllers/public/orders_controller.rb:25 Public::OrdersController#confirm:

    [1;34m13[0m: [32mdef[0m [1;34mconfirm[0m
    [1;34m14[0m:   @order = [1;34;4mOrder[0m.new(order_params)
    [1;34m15[0m:   [32mif[0m [33m:select_address[0m == [1;34m0[0m
    [1;34m16[0m:     @order.postal_code = current_customer.postal_code
    [1;34m17[0m:     @order.address = current_customer.address
    [1;34m18[0m:     @order.name = current_customer.first_name + current_customer.last_name
    [1;34m19[0m:   [32melsif[0m [33m:select_address[0m == [1;34m1[0m
    [1;34m20[0m:     @address = [1;34;4mAddress[0m.find(params[[33m:order[0m][[33m:address_id[0m])
    [1;34m21[0m:   [32melse[0m
    [1;34m22[0m:     @order = [1;34;4mOrder[0m.new(order_params)
    [1;34m23[0m:   [32mend[0m
    [1;34m24[0m: 
 => [1;34m25[0m:   binding.pry
    [1;34m26[0m: [32mend[0m

