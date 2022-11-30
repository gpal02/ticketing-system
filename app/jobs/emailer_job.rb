class EmailerJob < ApplicationJob
  queue_as :default

  def perform(id)
    RegistrationMailer.registration_mail(id).deliver_later
  end
end
