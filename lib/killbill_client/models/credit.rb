module KillBillClient
  module Model
    class Credit < CreditAttributes
      KILLBILL_API_CREDITS_PREFIX = "#{KILLBILL_API_PREFIX}/credits"
      has_many :audit_logs, KillBillClient::Model::AuditLog

      def create(auto_commit = false, user = nil, reason = nil, comment = nil, options = {})
        created_credit = self.class.post KILLBILL_API_CREDITS_PREFIX,
                                              to_json,
                                              {
                                                  :autoCommit => auto_commit
                                              },
                                              {
                                                  :user => user,
                                                  :reason => reason,
                                                  :comment => comment,
                                              }.merge(options)
        created_credit.refresh(options)
      end

      def retrieve_credit(credit_id, options = {})
        self.class.get "#{KILLBILL_API_CREDITS_PREFIX}/#{credit_id}",
            {},
            options,
            CreditAttributes
      end


    end
  end
end
