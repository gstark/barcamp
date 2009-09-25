class SponsorsController < ApplicationController
  before_filter :login_required, :except => :index
  
  def index
    @sponsors = Sponsor.find(:all)

    respond_to do |format|
      format.html
      format.json 
    end
  end
  
  def new
    @sponsor = Sponsor.new
  end
  
  def create
    @sponsor = Sponsor.create(params[:sponsor])
    if @sponsor.save
      flash[:notice] = "Sponsor created"
      redirect_to root_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @sponsor = Sponsor.find(params[:id])    
  end
  
  def update
    @sponsor = Sponsor.find(params[:id])
    @sponsor.update_attributes(params[:sponsor])
    if @sponsor.save
      flash[:notice] = "Sponsor updated"
      redirect_to root_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    Sponsor.destroy(params[:id])
    redirect_to sponsors_path
  end
  
end