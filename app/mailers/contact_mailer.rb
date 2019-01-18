# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          from: 'notification@example.com'

  # def new_registration(us
  #   @user = user
  #   mail(subject: "New User Signup: #{@user.email}")
  # end
  def new_item(item)
    @item = item
    # @admins_emails = Admin.pluck(:email)
    Admin.find_each do |admin|
      mail  to: admin.email,
            subject: "Dites bonjour au nouvel article #{@item.name}!"
    end
  end
end
