class User < ApplicationRecord

    after_initialize :ensure_session_token

    validates :username, :session_token, :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :username, uniqueness: true

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64(64)
        self.save!
        self.session_token
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end



    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end

    private

    def ensure_session_token
        self.session_token ||= SecureRandom.base64(64)
    end




    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal


end