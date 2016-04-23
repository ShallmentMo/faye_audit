require "faye_audit/version"

module FayeAudit
  def logger
    @@logger
  end

  def logger=(logger)
    @@logger = logger
  end

  def audit(bayeux)
    bayeux.on(:handshake) do |client_id|
      logger.info <<LOG
      handshake:
      client_id: #{client_id}
LOG
    end
    bayeux.on(:subscribe) do |client_id, channel|
      logger.info <<LOG
      subscribe:
      client_id: #{client_id}
      channel: #{channel}
LOG
    end
    bayeux.on(:unsubscribe) do |client_id, channel|
      logger.info <<LOG
      unsubscribe:
      client_id: #{client_id}
      channel: #{channel}
LOG
    end
    bayeux.on(:publish) do |client_id, channel, data|
      logger.info <<LOG
      publish:
      client_id: #{client_id}
      channel: #{channel}
      data: #{data}
LOG
    end
    bayeux.on(:disconnect) do |client_id|
      logger.info <<LOG
      disconnect:
      client_id: #{client_id}
LOG
    end
  end

  module_function :audit, :logger, :logger=
end
