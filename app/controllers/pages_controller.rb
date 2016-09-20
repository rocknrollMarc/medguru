class PagesController < ApplicationController

  def show
    slug = ""
    if params[:path].present?
      slug = params[:path]
    end
    @page = Page.where(slug: slug).first
    if @page.blank? || slug == ""
      render 'startpage', layout: 'startpage'
    end
  end

end
