module Services
  class Uuid
    def call
      SecureRandom.uuid
    end
  end
end
