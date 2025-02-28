json.id             order.id
json.user_id        order.user_id
json.subtotal       order.subtotal
json.tax            order.tax
json.total          order.total
json.created_at     order.created_at

json.carted_products order.carted_products.map do |cp|
  json.id       cp.id
  json.quantity cp.quantity
  json.product  cp.products
end

