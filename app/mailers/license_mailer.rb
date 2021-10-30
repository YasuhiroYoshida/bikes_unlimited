class LicenseMailer < ApplicationMailer
  def new_license_email
    @user = params[:user]

    attach_license
    mail(to: @user.email, subject: "Your license is ready!")
  end

  def attach_license
    pdf = Prawn::Document.new
    pdf.text(<<~RUBY)
      Your name: #{@user.name}
      You email: #{@user.email}
      Your license number: 1234567890
    RUBY

    attachments["license.pdf"] = pdf.render
  end
end
