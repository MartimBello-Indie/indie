module RvDomain
  module Commands
    class FindRv < Command
      def execute(id:)
        Rv.find(id)
 
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::RvNotFoundException.new(id: id)
      end
    end
  end
end