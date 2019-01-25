# frozen_string_literal: true

class CpfValidator < ActiveModel::EachValidator
  BLACKLIST = %w[
                  00000000000
                  11111111111
                  22222222222
                  33333333333
                  44444444444
                  55555555555
                  66666666666
                  77777777777
                  88888888888
                  99999999999
                  12345678909
                  01234567890
                ].freeze

  CPF_REGEX = %r[\A\d{3}.\d{3}.\d{3}-\d{2}\z]


  def validate_each(record, attribute, value)
    return unless value


    unless cpf_valid?(value)
      record.errors[attribute] << (options[:message] || 'inválido')
    end
  end

  def cpf_valid?(cpf)
    return false unless cpf =~ CPF_REGEX

    cpf = cpf.delete('.-').reverse

    return false if BLACKLIST.include?(cpf)

    first_digit = validate_digit(cpf[2..10])
    last_digit = validate_digit(cpf[1..10])

    [cpf[1].to_i == first_digit && cpf[0].to_i == last_digit]
  end

  def validate_digit(cpf)
    multiplier = 2
    sum = 0

    cpf.chars.each do |n|
      sum += n.to_i * multiplier
      multiplier += 1
    end

    digit = sum % 11
    digit < 2 ? 0 : 11 - digit
  end
end