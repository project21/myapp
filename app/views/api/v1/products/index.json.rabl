collection @products
attributes :id, :product_name,:details, :publisher_id
node (:product_url) {|product| product_url(product)}
child :publisher do
  attributes :email
end
 node (:url) { |product| "http://localhost:3000/api/products/" }