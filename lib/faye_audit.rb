require "faye_audit/version"

module FayeAudit
  def logger
    @@logger
  end

  def logger=(logger)
    @@logger = logger
  end

  def client_count
    @@bayeux.instance_variable_get(:@server)
            .instance_variable_get(:@engine)
            .instance_variable_get(:@engine)
            .instance_variable_get(:@clients).keys.size
  end

  def channel_count
    @@bayeux.instance_variable_get(:@server)
            .instance_variable_get(:@engine)
            .instance_variable_get(:@engine)
            .instance_variable_get(:@channels).size
  end

  def audit(bayeux)
    @@bayeux = bayeux
    bayeux.on(:handshake) do |client_id|
      logger.info <<LOG
      faye: { client_count: #{client_count + 1}, channel_count: #{channel_count} }
      handshake:
      client_id: #{client_id}
LOG
    end
    bayeux.on(:subscribe) do |client_id, channel|
      logger.info <<LOG
      faye: { client_count: #{client_count}, channel_count: #{channel_count} }
      subscribe:
      client_id: #{client_id}
      channel: #{channel}
LOG
    end
    bayeux.on(:unsubscribe) do |client_id, channel|
      logger.info <<LOG
      faye: { client_count: #{client_count}, channel_count: #{channel_count} }
      unsubscribe:
      client_id: #{client_id}
      channel: #{channel}
LOG
    end
    bayeux.on(:publish) do |client_id, channel, data|
      logger.info <<LOG
      faye: { client_count: #{client_count}, channel_count: #{channel_count} }
      publish:
      client_id: #{client_id}
      channel: #{channel}
      data: #{data}
LOG
    end
    bayeux.on(:disconnect) do |client_id|
      logger.info <<LOG
      faye: { client_count: #{client_count}, channel_count: #{channel_count} }
      disconnect:
      client_id: #{client_id}
LOG
    end
  end

  module_function :audit, :logger, :logger=, :client_count, :channel_count
end
