class CustomersController < ApplicationController
  before_action :set_customer, only: %i[edit update destroy]
  def index
    @q = Customer.ransack(params[:q])
    @pagy, @customers = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @customer = Customer.new
  end

  def edit; end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Artikel berhasil dibuat'
    else
      render 'new'
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Artikel berhasil diperbaharui'
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: 'Artikel berhasil dihapus'
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :address, :domicile)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
