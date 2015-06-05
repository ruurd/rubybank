class MutationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  # GET /accounts/:account_id/mutations
  def index
    @account = Account.find(params[:account_id])
    @mutations = @account.mutations.search(params[:search]).order(sort_specification).page(params[:page]).includes(:account).decorate
  end

  # GET /accounts/:account_id//mutations/1
  def show
    @account = Account.find(params[:account_id])
    @mutation = @account.mutations.find(params[:id]).decorate
  end

  # GET /accounts/:account_id//mutations/new
  def new
    @account = Account.find(params[:account_id])
    @mutation = Mutation.new
    @mutation.account = @account
  end

  # GET /accounts/:account_id//mutations/1/edit
  def edit
    @account = Account.find(params[:account_id])
    @mutation = @account.mutations.find(params[:id])
  end

  # POST /accounts/:account_id/mutations
  def create
    @account = Account.find(params[:account_id])
    @mutation = Mutation.new(mutation_params)
    @mutation.account = @account

    if @mutation.save
      redirect_to [@account, @mutation], notice: 'Mutation was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /accounts/:account_idmutations/1
  def update
    @account = Account.find(params[:account_id])
    @mutation = @account.mutations.find(params[:id])
    if @mutation.update(mutation_params)
      redirect_to [@account, @mutation], notice: 'Mutation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /accounts/:account_id/mutations/1
  def destroy
    @account = Account.find(params[:account_id])
    @mutation = Mutation.where(@account).find(params[:id])
    if @mutation
      @mutation.destroy
      redirect_to account_mutations_url(@account)
    else
      redirect_to account_mutations_url(@account), notice: 'Mutation to be deleted could not be found.'
    end
  end

  private

  def mutation_params
    params.require(:mutation).permit(:from_account, :comment, :amount)
  end

  def sort_column
    Mutation.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end