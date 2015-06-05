class AccountsController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  # GET /accounts
  def index
    @accounts = Account.where(user: current_user).search(params[:search]).order(sort_specification).page(params[:page]).decorate
  end

  # GET /accounts/1
  def show
    @account = Account.where(user: current_user).find(params[:id]).decorate
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.user_id = current_user.id
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.where(user: current_user).find(params[:id])
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /accounts/1
  def update
    @account = Account.where(user: current_user).find(params[:id])
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /accounts/1
  def destroy
    @account = Account.where(user: current_user).find(params[:id])
    @account.destroy
    redirect_to accounts_url
  end

  private

  def sort_column
    Account.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def account_params
    params.require(:account).permit(:iban, :comment, :initial_balance)
  end

end