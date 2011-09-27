class PasteController < ApplicationController
  def new
  end

  def create
  	@paste = Paste.new(params[:permalink])
  	@paste.save
  	redirect_to show_paste_path(@paste)
  end

  def show
  end

end
