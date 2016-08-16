class Admin::PagesController < Admin::AdminController
  include TheSortableTreeController::Rebuild

  def index
    @pages = Page.nested_set.select('id, title, parent_id').all
  end

  def new
    @page = Page.new
  end

end
