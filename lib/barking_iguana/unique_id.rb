require 'base_n'
require 'socket'

module BarkingIguana
  module UniqueId
    autoload :VERSION, 'barking_iguana/unique_id/version'

    def self.seed seed
      srand seed
    end

    def self.generate
      t, n = Time.now.to_f.to_s.split('.', 2).map { |s| squash s }
      r = squash(rand(9_999_999_999))
      [ prefix, t, n, r ].join '-'
    end

    def self.hostname
      @hostname ||= Socket.gethostname.split(/\./, 2)[0]
    end
    class << self
      attr_writer :hostname
      protected :hostname
    end

    def self.prefix
      @prefix ||= [ VERSION, hostname, squash(Process.pid) ].join('-')
    end
    class << self
      attr_writer :prefix
      protected :prefix
    end

    def self.squash number
      BaseN::Number.new(number.to_s, 10).rebase(62).to_s
    end
    class << self
      protected :squash
    end
  end
end
