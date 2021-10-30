class ReportMailer < ApplicationMailer
  def report_email
    @success_count = params[:success_count]
    @failed_user_names = params[:failed_user_names]

    mail(to: %w[yyoshida.at.work@gmail.com abc@processingcenter.com], subject: "Nightly batch results")
  end
end
