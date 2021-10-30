# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  def report_email
    @success_count = 2
    @failed_user_names = ["John Doe"]

    ReportMailer.with(success_count: @success_count, failed_user_names: @failed_user_names).report_email
  end
end
