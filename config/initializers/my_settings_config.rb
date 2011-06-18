if defined?(MySettings)
  MySettings.company_full_name = "Enterprise site company" if MySettings.company_full_name.nil?
  MySettings.company_introduce = " " if MySettings.company_introduce.nil?
end