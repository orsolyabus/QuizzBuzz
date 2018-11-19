class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "--------------"
    puts "Sending mail"
    puts "--------------"
  end
end
