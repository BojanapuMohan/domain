require 'alexa'
require 'date'
class NewdomainsController < ApplicationController
  before_action :set_newdomain, only: [:show, :edit, :update, :destroy]

  def index
    @newdomains = Newdomain.all
  end

  def show
    
  end

  def new
    @newdomain = Newdomain.new
  end

  def edit
  end


  def create
    domainname = params[:newdomain][:domain_name]
    
    client = Alexa::Client.new(access_key_id: "your access_key_id",   

                    secret_access_key:"your secret key")
    rankNO = client.url_info(url: domainname).rank
    params[:newdomain][:rank] = rankNO;
   
    @newdomain = Newdomain.new(newdomain_params)
    respond_to do |format|
      if @newdomain.save
        currentdate = DateTime.now.strftime('%Q')
        @newdomainRank = Newdomain.find(@newdomain.id)        
        @rank = @newdomainRank.domainranks.create!(:rank => @newdomain.rank, :created_date => currentdate)
        
        format.html { redirect_to @newdomain, notice: 'Newdomain was successfully created.' }
        format.json { render :show, status: :created, location: @newdomain }
      else
        format.html { render :new }
        format.json { render json: @newdomain.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @newdomain.update(newdomain_params)
        format.html { redirect_to @newdomain, notice: 'Newdomain was successfully updated.' }
        format.json { render :show, status: :ok, location: @newdomain }
      else
        format.html { render :edit }
        format.json { render json: @newdomain.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @newdomain.destroy
    respond_to do |format|
      format.html { redirect_to newdomains_url, notice: 'Newdomain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_newdomain
      @newdomain = Newdomain.find(params[:id])
    end

    def newdomain_params
      params.require(:newdomain).permit(:domain_name, :rank)
    end
end
