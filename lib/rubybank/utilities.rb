module Rubybank
  module Utilities
    def self.generate_correlation_code(length)
      generated_code = ""
      alphanumerics = 'ABCDFGHJKLMNPRSTUVWXYZ23456789'.split(//)
      begin
        generated_code = alphanumerics.sort_by { rand }.join[0..length - 1]
      end while (Mutation.exists?(correlation_code: generated_code))
      generated_code
    end
  end
end