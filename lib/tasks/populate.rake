namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Category, Product, Publisher].each(&:delete_all)
    
    
    Publisher.populate 100 do |publisher|
      publisher.password    = Faker::Name.name
      publisher.email   = Faker::Internet.email
     publisher.type= "Publisher"
      Product.populate 10..100 do |product|
       
        product.publisher_id=publisher.id
        product.product_name = Populator.words(1..5).titleize
        product.details = Populator.sentences(2..10)
        product.created_at = 2.years.ago..Time.now
      end
    end
    
  
  end
end