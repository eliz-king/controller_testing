class BankAccountsController < ApplicationController
  before_action :find_bank_account, only: [:show, :edit, :destroy, :update]

  # GET  /bank_accounts
  def index
    @bank_accounts = current_user.bank_accounts
  end

  # GET  /bank_accounts/:id
  def show
  end

  # GET  /bank_accounts/new
  def new
    @bank_account = current_user.bank_accounts.new
  end

  # GET  /bank_accounts/edit
  def edit
  end

  # PUT/PATCH /bank_accounts/:id
  def update
    if @bank_account.update(bank_account_params)
      redirect_to @bank_account
    else
      render :edit
    end
  end

  # POST  /bank_accounts
  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)

    if @bank_account.save
      redirect_to @bank_account
    else
      render :new
    end
  end

  # DELETE /bank_accounts/:id
  def destroy
    @bank_account.destroy
    redirect_to bank_accounts_url
  end

  private
    def bank_account_params
      params.require(:bank_account).permit(:amount, :institution, :active, :body)
    end

    # call back method to find a bank account
    def find_bank_account
      @bank_account = current_user.bank_accounts.find(params[:id])
    end
end