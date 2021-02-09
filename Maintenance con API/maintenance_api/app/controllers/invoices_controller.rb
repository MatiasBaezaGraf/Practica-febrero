class InvoicesController < ApplicationController 
  before_action :set_invoice, only: [:show, :update, :destroy]

  # GET /invoices
  def index
    if params[:brand_id]
      #@invoices = Invoice.all
      @invoices = Invoice.filterbrand(params[:brand_id])
    elsif params[:replacement_id]
      #@invoices = Invoice.all
      @invoices = Invoice.filterreplacement(params[:replacement_id])
    elsif params[:price] and params[:option]
      @invoices = Invoice.filterthan(params[:price], params[:option])
    elsif params[:price].blank? and params[:option].blank?
      @invoices = Invoice.all
    else
      @invoices = Invoice.all
    end

    @option = [["Smaller", 0],["Bigger", 1]]

    render json: @invoices
  end

  # GET /invoices/1
  def show
    render json: @invoice
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:bill_date)
    end
end
