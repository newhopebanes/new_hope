class StaticPagesController < ApplicationController
  def about
  	@documents = Document.all
  end

  def links
  end

  def contact
  end

  def home
  end
end
