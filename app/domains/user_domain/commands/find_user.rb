module UserDomain
  module Commands
    class FindUser < Command
      def execute(id:)
        User.find(id)
 
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::UserNotFoundException.new(id: id)
      end
    end
  end
end