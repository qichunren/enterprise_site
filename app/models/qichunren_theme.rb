# encoding: utf-8
class QichunrenTheme
  attr_accessor :cover
  attr_accessor :name
  attr_accessor :author
  attr_accessor :tags
  attr_accessor :website
  
  def self.all_themes
    themes = []
    Dir.glob(Rails.root.join("themes/*")).each do |theme_dir|
      themes << QichunrenTheme.new()
    end
  end
  
  def initialize(options={})
    @cover   = options[:cover]
    @name    = options[:name]
    @author  = options[:author]
    @tags    = options[:tags]
    @website = options[:website]
  end
  
end