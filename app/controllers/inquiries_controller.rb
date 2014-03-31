class InquiriesController < ApplicationController
  # before_action :set_inquiry, only: [:new, :show, :update, :destroy]

  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def show
    @inquiry = Inquiry.find(params['id'])
  end
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to inquiries_path, notice: 'Inquiry was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    @inquiry = Inquiry.find(params['id'])
    @inquiry.destroy
    redirect_to inquiries_path
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:email, :subject, :description, :first_name, :last_name)
    end
end
