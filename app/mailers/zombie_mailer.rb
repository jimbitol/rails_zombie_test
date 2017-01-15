class ZombieMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.decomp_change.subject
  #
  def decomp_change(zombie)

    @zombie = zombie
    @brain = @zombie.brain
    @greeting = "Hi"

    attachments['resume.pdf'] = File.read("#{Rails.root}/public/MCABRERA_RESUME.pdf")


    mail from: "no-responder@testrails.com", to: "maxcabrera815@gmail.com", subject: 'New message from my rails website'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.lost_brain.subject
  #
  def lost_brain
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
