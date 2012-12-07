
module Api  
  module V1
class ProductsController < ApplicationController

  class Product < ::Product
        def as_json(options={})
         super.merge(:publisher_details=>"http://localhost:3000/api/users/#{publisher_id}")
        end
      end
  # GET /products
  # GET /products.json
  respond_to :json, :xml
  def index
=begin
    @products=Product.paginate(:page=>params[:page],:per_page => params[:per_page]).all(:include => :publisher)
      log = Logger.new(STDOUT)
      log.error("before hello")
    @say= Product.say
     log.debug("after hello")
    respond_to do |format|
     # format.html # index.html.erb
      format.json { render json: @products.to_json(:include=>{:publisher=>{:only=>[:email]}})}
      format.xml
    end
=end
Rails.cache.fetch("all_products", :expires_in => 3.minutes) do
@products=Product.all
respond_with(@products)
     end
  end

  def product_list
=begin
  products=Product.all

data=products.inject({}) do |result,product_id|
  result.merge!("freshness" =>{:fresh =>Product.fresh(product_id).count ,:id=>product_id.id})
  result
    end
render :json=>data.to_json
=end

=begin
products=Product.all

data=products.inject({}) do |result,product_id|

 result.merge!(:fresh =>Product.fresh(product_id).count, :id=>product_id.id)
    end   
render :json=>data.to_json
=end
@products=Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    expires_in 3.minutes, :public => true
      if stale?(@product)
    respond_with(@product)
      end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

      if @product.save
      
        respond_with(@product, :location=>products_url)
      else
       respond_with(@product, :head=>:bad_request)
      end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
end 
end