# frozen_string_literal: true

class CnpjValidator < ActiveModel::EachValidator
  BLACKLIST = %w[
                  00000000000000
                  11111111111111
                  22222222222222
                  33333333333333
                  44444444444444
                  55555555555555
                  66666666666666
                  77777777777777
                  88888888888888
                  99999999999999
                ].freeze

  CNPJ_REGEX = %r[\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z]


  def validate_each(record, attribute, value)
    return unless value

    unless cnpj_valid?(value)
      record.errors[attribute] << (options[:message] || "inválido")
    end
  end

  def cnpj_valid?(cnpj)
    return false unless cnpj =~ CNPJ_REGEX

    cnpj = cnpj.delete('./-')

    return false if BLACKLIST.include? cnpj

    cnpj_reverse = cnpj.reverse

    first_digit = validate_digit(cnpj_reverse[2..13])
    last_digit = validate_digit(cnpj_reverse[1..13])

    cnpj[12].to_i == first_digit && cnpj[13].to_i == last_digit
  end

  def validate_digit(cnpj)
    index = 2

    sum = cnpj.chars.map(&:to_i).inject(0) do |sum, n|
      (sum + n * index).tap do
        index = index == 9 ? 2 : index + 1
      end
    end

    digit = sum % 11
    digit < 2 ? 0 : 11 - digit
  end
end