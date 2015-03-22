class ContactForm < MailForm::Base
  attribute  :name
  attribute  :email
  attribute  :phone
  attribute  :building
  attribute  :pets
  attribute  :smoker
  attribute  :student
  attribute  :comments
  
  validates_presence_of :name, :email, :phone
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "Wromg email format"
  validates_format_of :phone, with: /\A([1]-)?[0-9]{3}-|\s[0-9]{3}-|\s[0-9]{4}\z/, message: "Wrong phone format"
  
  def headers
    {
      :subject => "Brookview Properties Contact",
      :to => "brookviewonellc@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end