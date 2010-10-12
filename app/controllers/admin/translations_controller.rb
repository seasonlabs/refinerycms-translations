class Admin::TranslationsController < Admin::BaseController

  crudify :translation, :title_attribute => :name, :order => "fresh, updated_at DESC, name ASC"
  
private  
  def paginate_all_translations
    if params[:language]
      @translations = Translation.paginate :page => params[:page],
                                                    :order => "fresh, updated_at DESC, name ASC",
                                                    :conditions => {:locale => params[:language]}
    else
      @translations = Translation.paginate :page => params[:page],
                                                    :order => "fresh, updated_at DESC, name ASC"    
    end
  end
end
