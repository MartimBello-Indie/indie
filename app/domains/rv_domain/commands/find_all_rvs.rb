module RvDomain
  module Commands
    class FindAllRvs < Command

      def execute
        Rv.all
 
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::NoRvsException.new
      end
    end
  end
end