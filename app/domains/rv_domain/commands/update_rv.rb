module RvDomain
  module Commands
    class UpdateRv < Command

      def execute(update_params:)
        @params = update_params

        update_rv

      end

      private

      def update_rv
        @rv = Rv.find(@params[:id])

        @rv.update(@params)

        if @rv.save
          @rv
        else
          raise Exceptions::UnprocessableEntityException.new("Unknown error in rv update.")
        end
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::RvNotFoundException.new(id: @rv_id)
      end
    end
  end
end