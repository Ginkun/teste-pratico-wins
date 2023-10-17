local queue = {
    ['group_1'] = {
        players = {
            {
                id = 1,
                name = "ViperGT"
            }
        }
    },
    ['group_4'] = {
        players = {
            {
                id = 2,
                name = "BlazeGamer"
            },
            {
                id = 3,
                name = "SpeedRacer"
            },
            {
                id = 4,
                name = "ShadowNinja"
            },
            {
                id = 5,
                name = "PhoenixFire"
            }
        }
    },
    ['group_6'] = {
        players = {
            {
                id = 6,
                name = "ThunderBolt"
            },
            {
                id = 7,
                name = "GhostRider"
            }
        }
    },
    ['group_9'] = {
        players = {
            {
                id = 8,
                name = "NeonSpectre"
            },
            {
                id = 9,
                name = "DriftKing"
            }
        }
    },
    ['group_10'] = {
        players = {
            {
                id = 10,
                name = "MidnightWolf"
            }
        }
    }
}

local completandoGrupos = {}
local GruposIncompletos = {}

for grupoNomes, grupoDatas in pairs(queue) do
    if #grupoDatas.players == 5 then
        completandoGrupos[grupoNomes] = grupoDatas
    else
        GruposIncompletos[grupoNomes] = grupoDatas
    end
end

local timesPorCor = {
    ["blue"] = {
        players = {}
    },
    ["red"] = {
        players = {}
    }
}

local timesSeparadosNome = { "blue", "red" }
local determinandoValoresTime = 1

for grupoNomes, grupoDatas in pairs(completandoGrupos) do
    for _, player in ipairs(grupoDatas.players) do
        table.insert(timesPorCor[timesSeparadosNome[determinandoValoresTime]].players, player)
        player.group = grupoNomes
        determinandoValoresTime = (determinandoValoresTime % 2) + 1
    end
end

for grupoNomes, grupoDatas in pairs(GruposIncompletos) do
    for _, player in ipairs(grupoDatas.players) do
        table.insert(timesPorCor[timesSeparadosNome[determinandoValoresTime]].players, player)
        player.group = grupoNomes
        determinandoValoresTime = (determinandoValoresTime % 2) + 1
    end
end

for nomeTime, timeDatas in pairs(timesPorCor) do
    print("Time " .. nomeTime)
    for _, player in ipairs(timeDatas.players) do
        print(player.name .. " (Grupo " .. player.group .. ")")
    end
end
