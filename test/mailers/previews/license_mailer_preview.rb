# Preview all emails at http://localhost:3000/rails/mailers/license_mailer
class LicenseMailerPreview < ActionMailer::Preview
  def new_license_email
    @user = User.first
    LicenseMailer.with(user: @user).new_license_email
  end
end
