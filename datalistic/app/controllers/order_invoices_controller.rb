class OrderInvoicesController < ApplicationController
  before_action :set_order_invoice, only: [:show, :edit, :update, :destroy]

  # GET /order_invoices
  # GET /order_invoices.json
  def index
    @order_invoices = OrderInvoice.all
  end

  # GET /order_invoices/1
  # GET /order_invoices/1.json
  def show
  end

  # GET /order_invoices/new
  def new
    @order_invoice = OrderInvoice.new
  end

  # GET /order_invoices/1/edit
  def edit
  end

  # POST /order_invoices
  # POST /order_invoices.json
  def create
    @order_invoice = OrderInvoice.new(order_invoice_params)

    respond_to do |format|
      if @order_invoice.save
        format.html { redirect_to @order_invoice, notice: 'Order invoice was successfully created.' }
        format.json { render :show, status: :created, location: @order_invoice }
      else
        format.html { render :new }
        format.json { render json: @order_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_invoices/1
  # PATCH/PUT /order_invoices/1.json
  def update
    respond_to do |format|
      if @order_invoice.update(order_invoice_params)
        format.html { redirect_to @order_invoice, notice: 'Order invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_invoice }
      else
        format.html { render :edit }
        format.json { render json: @order_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_invoices/1
  # DELETE /order_invoices/1.json
  def destroy
    @order_invoice.destroy
    respond_to do |format|
      format.html { redirect_to order_invoices_url, notice: 'Order invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_invoice
      @order_invoice = OrderInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_invoice_params
      params.fetch(:order_invoice, {})
    end
end
