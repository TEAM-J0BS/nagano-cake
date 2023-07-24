class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @genres = Genre.all
  end

  def edit
    @customer = current_customer
    @genres = Genre.all
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
    @genres = Genre.all
  end

  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :last_name_kana,
                                     :first_name_kana,
                                     :postcode,
                                     :address,
                                     :phone_number,
                                     :email
                                     )
  end

end
