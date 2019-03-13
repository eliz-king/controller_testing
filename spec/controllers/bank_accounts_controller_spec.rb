require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  login_user
  #method from controller macros to create user & log in

#creating 2 variables of hashes:
  let(:valid_attr) {
    { amount: 200,
      institution: 'Chase',
      active: true
    }
  } #this should pass

  let(:invalid_attr) {
    { amount: 200,
      institution: '',
      active: true
    }
  } #this should fail

#anytime expecting just a webpage this how test looks:
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

#should show a particular bank acct
  describe "GET #show" do
    it "returns http success" do
      bank_account = @user.bank_account.create! valid_attr
      #BankAccount.find(params[:id]) - have to test for this
      get :show, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

#shows form
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

#shows form
  describe "GET #edit" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attr #using var created abve
      get :edit, prams: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post/create" do
    context "with valid Params" do
      # def create
      #   @bank_account = BankAccount.new(bank_account_params)
      #   if @bank_account.save
      #     redirect_to @bank_account (or could be bank_accounts_path)
      #   else
      #     render :new
      #   end
      # end - this creates a record in db & redirects
      it "creates a new bank account" do
        expect {
          post :create, params: {bank_account: valid_attr}
        }.to change(BankAccount, :count).by(1) #should add a bank acct
      end

      it "redirect to the new bank acct" do
        post :create, params: {bank_account: valid_attr}
        expect(response).to redirect_to(BankAccount.last) #new record will be the last one in the record
      end
    end

    context "with invalid params" do
      it "does not create a new bank acct" do
        expect {
          post :create, params: {bank_account: invalid_attr}
        }.to change(BankAccount, :count).by(0)
      end

      it "renders the new form" do
      post :create, params: {bank_account: invalid_attr}
      expect(response).to be_successful
      end
    end
  end

  describe "put / pudate" do
    # find the bank account we're updating
    # BankAccount.find(params[:id])
    # if @bank_accountupdate(bank_account_params)
      # redirect_to @bank_account
    #else
      # doesn't update
      # render :edit form
    context "with valid params" do
      it "update a bank account that is requested" do

      end

      it "redirect to the bank account" do

      end
    end

    context "with invalid params" do
      it "does not update the bank account" do

      end
      it 'renders the edit form' do

      end
    end
  end

end