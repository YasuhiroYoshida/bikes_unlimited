class LicenseMailer < ApplicationMailer
  def new_license_email
    @user = params[:user]

    mail(to: @user.email, subject: "Your license is ready!")
  end
end
