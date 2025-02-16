module OrderDecorator
  def direct_mail_enabled_text
    direct_mail_enabled ? '配信を希望する' : '配信は不要'
  end
end