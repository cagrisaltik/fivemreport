webHookURL = "https://discordapp.com/api/webhooks/665885464787419136/CHiQQ8qGLMNxl63lyhxxSFZJ3oG4pwgMogihVUxoNU4GcM94fWC_0p8eeOTRubbwbnsj" -- Raporlamalar Hangi Discord Odasına Düşmesini İstiyorsan O Odaının Webhook u
local DISCORD_NAME = "Rapor Botu" -- Botun Discordaki Görülücek İsmi
local DISCORD_IMAGE = "https://newsfeed.org/wp-content/uploads/social-media-reports-Facebook-reports-Instagram-reports.jpg" -- Herhangi Bir Resim URL si Ekleyebilirsin
local role = "662003259137065007" -- Bota Verilicek Role Id Kesinlikle Herkesten Üstün Rol Vermen Lazım
enableReport = true -- /report Komutunu Aktif Hale Getirir
local role = "<@&"..role..">"

if enableReport thens
    RegisterCommand("report", function(source, args, rawCommand)
        local user = tonumber(args[1])
        local msg = table.concat(args, " ", 2)
        local username = GetPlayerName(user)
		local reporter = GetPlayerName(source)
		if username == nil then
			print("ID'yi Doğru Girdiğinizden Emin Olun")
		else
			color = 16711680
			print("Kullanıcı".. username .. " Yetkiliye Şikayet Edildi!")
            
            local ping = GetPlayerPing(user)
            local identifiers = GetPlayerIdentifiers(user)
            local data = json.encode(identifiers)

            local connect = {
                {
                    ["color"] = color,
                    ["title"] = "Kullanıcı ["..user.."] ".. username .. " Şu Sebepten Şikayet Edildi: ",
                    ["description"] = "Sebep: **"..msg.."**\nPing: **"..ping.."**\nKimlik: **"..data.."**",
                    ["footer"] = {
                    ["text"] = "Rapor : "..reporter.. ".",
                    },
                }
            }
            PerformHttpRequest(webHookURL, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = role , embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
		end
    end)

end
