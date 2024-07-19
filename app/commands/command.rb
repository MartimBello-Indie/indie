class Command
  def self.execute(**params)
    command = new
    raise "#{self.class} must implement 'execute'" unless command.respond_to?(:execute)

    command.execute(**params)
  end
end