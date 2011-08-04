# encoding: utf-8
require File.expand_path("../../config/environment", __FILE__)
require File.expand_path("../../app/helpers/application_helper", __FILE__)
class StaticPageGenerator
  
  attr_reader :source_dir, :output_dir
  
  def initialize(output_dir=Rails.root.join("html"))
    @source_dir = Rails.root.join("themes/default/views")
    @output_dir = output_dir
    FileUtils.mkdir_p(output_dir) if not File.exist?(output_dir)
  end
  
  def generate
    puts Product.count.to_s
    generate_html("home/index")
  end
  
  
  def generate_html(page)
    puts "Generating #{page}.html"
    File.open(File.join(output_dir, "output_file.html"), 'w') do |f|
      view = ActionView::Base.new(source_dir, :edge => false)
      view.extend(ApplicationHelper)

      # Generate the special pages like the home.
      result = view.render(:layout => 'layouts/application', :file => File.join(source_dir, page))

      f.write result
    end
  end
  
end

StaticPageGenerator.new.generate