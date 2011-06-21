if defined?(MySettings)
  MySettings.company_full_name = "Enterprise site company" if MySettings.company_full_name.nil?
  MySettings.company_introduce = " " if MySettings.company_introduce.nil?
  MySettings.enable_product_module = true
  MySettings.current_theme = "default" if MySettings.current_theme.nil?
end