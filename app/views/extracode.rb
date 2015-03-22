  #validates_presence_of :name, :email, :phone
  #validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "Wromg email format"
  #validates_format_of :phone, with: /\A([1]-)?[0-9]{3}-|\s[0-9]{3}-|\s[0-9]{4}\z/, message: "Wrong phone format"
<%= f.error_notification %>