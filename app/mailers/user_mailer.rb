class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.survey.subject
  #
  def survey(name:, email:)
    @name = name
    @email = email
    mail to: @email, subject: "Thanks for joining the Buyt waitlist"
  end
end
