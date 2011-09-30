class PastesController < ApplicationController
  def new
  	@paste = Paste.new

  	respond_to do |format|
  		format.html
  	end
  end

  def create
  	@paste = Paste.new(params[:paste])
  	@paste.save
  	redirect_to "/#{@paste.permalink}"
  end

  def show
  	@paste = Paste.find_by_permalink(params[:permalink])

    if @paste == nil then
      redirect_to :root
    else
  	 respond_to do |format|
  	   	format.html
  	 end
    end
  end
end
