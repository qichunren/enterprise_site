# ThemeEngine::Engine.routes.draw do 
Rails.application.routes.draw do |map|
  match "/blog/omg" => "main#omg"
end