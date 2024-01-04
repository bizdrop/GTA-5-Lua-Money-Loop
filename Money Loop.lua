g_lua.register()

function trigger_transaction()
    SCRIPT.SET_GLOBAL_I(4536533 + 1, 2147483646)
    SCRIPT.SET_GLOBAL_I(4536533 + 7, 2147483647)
    SCRIPT.SET_GLOBAL_I(4536533 + 6, 0)
    SCRIPT.SET_GLOBAL_I(4536533 + 5, 0)
    SCRIPT.SET_GLOBAL_I(4536533 + 3, 0x615762F1)
    SCRIPT.SET_GLOBAL_I(4536533 + 2, 1000000)
    SCRIPT.SET_GLOBAL_I(4536533, 2)
end

g_gui.add_submenu("Lua Options", "Money Loop")
g_gui.add_toggle("Money Loop", "1 Million Money Loop", false, function(bool)
    money_loop = bool
end)

while g_isRunning do
    if money_loop then
        trigger_transaction()
        g_util.yield(300)
    else
        g_util.yield()
    end
    g_util.yield()
end