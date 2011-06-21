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
      theme_dir_name = theme_dir.split("/").last
      readme_file = theme_dir + "/README.yml"
      cover_file  = theme_dir + "/images/cover.png"
      if File.exists?(readme_file)
        hash = YAML.load(File.read(readme_file))
      else
        hash = {"name" => "Unfined (#{theme_dir_name})", "author" => "Unknow"}
      end
      if File.exists?(cover_file)
        hash.merge!("cover" => "/themes/#{theme_dir_name}/images/cover.png")
      else
        hash.merge!("cover" => "/images/front/logo.jpg")
      end

      
      themes << QichunrenTheme.new(hash)
    end
    themes
  end
  
  def initialize(options={})
    @cover   = options["cover"]
    @name    = options["name"]
    @author  = options["author"]
    @tags    = options["tags"]
    @website = options["website"]
  end
  
end

# http://www.templatemonster.com/ecommerce-templates.php