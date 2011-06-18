# coding: utf-8
class Syspanel::ThemesController < Syspanel::BaseController
  
  # GET /syspanel/themes
  def index
    @themes = QichunrenTheme.all_themes
  end
  
end