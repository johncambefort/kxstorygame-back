# frozen_string_literal: true

class User < ApplicationRecord
  MAILER_FROM_EMAIL = 'no-reply@example.com'
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
  PASSWORD_RESET_TOKEN_EXPIRATION = 10.minutes

  has_and_belongs_to_many :poems
  has_many :active_sessions, dependent: :destroy
  has_secure_password
  attr_accessor :current_password

  before_save :downcase_email
  before_save :downcase_unconfirmed_email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :unconfirmed_email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }
  validates :username, format: { with: /\A[a-z0-9A-Z]+\z/ }, length: { in: 4..20 }, presence: true, uniqueness: true
  def confirm!
    if unconfirmed_or_reconfirming?
      return false if unconfirmed_email.present? && !update(email: unconfirmed_email, unconfirmed_email: nil)

      update_columns(confirmed_at: Time.current)
    else
      false
    end
  end

  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  def unconfirmed?
    !confirmed?
  end

  def reconfirming?
    unconfirmed_email.present?
  end

  def unconfirmed_or_reconfirming?
    unconfirmed? || reconfirming?
  end

  def confirmable_email
    unconfirmed_email.presence || email
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.confirmation(self, confirmation_token).deliver_now
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  def self.authenticate_by(attributes)
    passwords, identifiers = attributes.to_h.partition do |name, _value|
      !has_attribute?(name) && has_attribute?("#{name}_digest")
    end.map(&:to_h)

    raise ArgumentError, 'One or more password arguments are required' if passwords.empty?
    raise ArgumentError, 'One or more finder arguments are required' if identifiers.empty?

    if (record = find_by(identifiers))
      record if passwords.count { |name, value| record.public_send(:"authenticate_#{name}", value) } == passwords.size
    else
      new(passwords)
      nil
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def downcase_unconfirmed_email
    return if unconfirmed_email.nil?

    self.unconfirmed_email = unconfirmed_email.downcase
  end
end
