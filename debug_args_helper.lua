-- helper code to debug args
local function debug_args(args)
    log.debug("\n\nnew log: " .. tostring(os.time()) .. "\n")
    for i = 1, #args do
        if args[i] ~= nil then
            log.debug("\n--- " .. tostring(i) .. " ---")
            pcall(
                function(...)
                    local this = sdk.to_managed_object(args[i])
                    if this ~= nil then
                        log.debug(tostring(this))
                        log.debug("type: managed_object")
                        log.debug(tostring(this:get_field("value__")))
                    end
                end
            )
            pcall(
                function(...)
                    local this = sdk.to_int32(args[i])
                    if this ~= nil then
                        log.debug(tostring(this))
                        log.debug("type: int32")
                    end
                end
            )
            pcall(
                function(...)
                    local this = sdk.to_int64(args[i])
                    if this ~= nil then
                        log.debug(tostring(this))
                        log.debug("type: int64")
                    end
                end
            )
            pcall(
                function(...)
                    local this = sdk.to_ptr(args[i])
                    if this ~= nil then
                        log.debug(tostring(this))
                        log.debug("type: ptr")
                    end
                end
            )
        end
    end
end
