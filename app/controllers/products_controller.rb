class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  def search
    query = "
      #{params[:receiver]} #{params[:gender_specific]} #{params[:style]} #{params[:theme]}
    "
    elements = Product.search(query, fields: [:tags]).map do |e|
      {
        "title": e.title,
        "image_url": e.image_url,
        "subtitle": e.subtitle,
        "buttons":[
          {
            "type": "web_url",
            "url": e.url,
            "title": "View Item"
          }
        ]
      }
    end

    json = {
     "messages": [{
        "attachment":{
          "type": "template",
          "payload": {
            "template_type": "generic",
            "image_aspect_ratio": "square",
            "elements": elements
          }
        }
      }]
    }

    render json: json
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :subtitle, :url, :image_url, :tags, :receiver, :gender_specific, :style, :theme)
    end
end
