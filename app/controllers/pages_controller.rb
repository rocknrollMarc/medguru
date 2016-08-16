class PagesController < ApplicationController

  def show
    slug = ""
    if params[:path].present?
      slug = params[:path]
    end
    @page = Page.where(slug: slug).first
  end

end
