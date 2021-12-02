local kong = {
    request = {
        get_body = spy.new(function()
            return {
                age = 43,
                birthday = "1976-09-30",
                name = "Marcelo33",
            }
        end),
    }
}
local log = spy.new(function(status, error)
    return status, error
end)

_G.ngx.log = log
_G.kong = kong

local producer = require 'kong.plugins.luizalabs-kafka.producer'
local handler = require('kong.plugins.luizalabs-kafka.handler')

describe("handler test call phase", function()
    local config = {}
    before_each(function()
        config = {
            {
                bootstrap_servers = { "localhost:9092" },
                keepalive = 60000,
                producer_async = true,
                producer_async_buffering_limits_messages_in_memory = 50000,
                producer_async_flush_timeout = 1000,
                producer_request_acks = 1,
                producer_request_limits_bytes_per_request = 1048576,
                producer_request_limits_messages_per_request = 200,
                producer_request_retries_backoff_timeout = 100,
                producer_request_retries_max_attempts = 10,
                producer_request_timeout = 2000,
                service_id = "6efeb675-24b3-4964-9d76-3273aec487ee",
                timeout = 10000,
                topic = "message.topic"
            }
        }
    end)

    describe("create object LuizalabsCache ", function()
        it("initialize LuizalabsCache ", function()
            handler:new()
            assert.equals(handler._name, "luizalabs-kafka")
            assert.equals(handler.PRIORITY, 500)
            assert.equals(handler.VERSION, "1.0.0")
            assert.is_truthy(handler.access)
        end)
    end)

    describe("Phase access ", function()
        it("calling a phase of success", function()
            producer.execute = spy.new(function()
                return true
            end)
            handler:access(config)
            assert.spy(producer.execute).was.called()
        end)

        it("calling a phase of error", function()
            producer.execute = spy.new(function()
                return error({ message = "error" })
            end)
            handler:access(config)
            assert.spy(producer.execute).was.called()
            assert.spy(ngx.log).was.called()
        end)
    end)

end)




