
if getgenv().PMAO == true return end
getgenv().PMAO = true
    local CurrentVersion = "TC.0.1.0"
    
    --Call the library
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
    
    --Main Frame
    local Window = Fluent:CreateWindow({
    Title = CurrentVersion,
    SubTitle = "by Keks",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
    })

    --Local Vars
    getgenv().TPPlace = "string"
    local LPlayer = game.Players.LocalPlayer
    local Pads = workspace:FindFirstChild("Pads") :: Folder
    local Frieren = workspace:FindFirstChild("snow area") :: Folder
    local Secrets = workspace:FindFirstChild("Secrets") :: Folder
    local secretBraceletDoor = Secrets:FindFirstChild("Return Door") :: Model
    local FarmExp = false
    
    local cache = {
      expPad = Pads.ExpPad,
      itemPad = Pads.ItemDropper,
      secretHelm = Secrets.Helm,
      secretBracelet = secretBraceletDoor:FindFirstChild("Teleport") :: Part,
      frierenStaff = Frieren:FindFirstChild("Secret tp 1") :: Part,
    }

    

    --Functions
    function Teleport(teleportPlace)
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = teleportPlace
    end

    --Tabs
    local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "circle-alert" }),
    Main = Window:AddTab({ Title = "Main", Icon = "banana" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Teleports = Window:AddTab({ Title = "Teleports to Specials", Icon = "accessibility"}),
    }

    do
    Fluent:Notify({
        Title = "Hi bro",
        Content = "good game :)",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.Info:AddParagraph({
        Title = "WARNING",
        Content = "Use it at your own risk"
    })

    Tabs.Main:AddParagraph({
        Title = "Info",
        Content = "Don't use Get Exp for a long time, dont jump"
    })

    Tabs.Main:AddToggle("MyToggle", {
        Title = "Get Exp",
        Default = false,
        Callback = function(state)
            FarmExp = state
            while FarmExp do
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.expPad, 0)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.expPad, 1)
            wait(0.01)
            end
        end
    })

    Tabs.Main:AddButton({
        Title = "Get Items",
        Description = "This button will get you items.",
        Callback = function()
            --Teleport(game:GetService("Workspace").Pads.ItemDropper.CFrame)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.itemPad, 0)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.itemPad, 1)
            
        end
    })

    local Slider = Tabs.Settings:AddSlider("Slider", {
        Title = "Speed",
        Description = "Change your speed\nNormal speed is 56",
        Default = 56,
        Min = 56,
        Max = 600,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })

    Slider:OnChanged(function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end)

    Slider:SetValue(100)
    
    local Slider = Tabs.Settings:AddSlider("Slider", {
        Title = "Jump",
        Description = "Change your jump",
        Default = 10,
        Min = 50,
        Max = 80,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    })

    Slider:OnChanged(function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end)

    Slider:SetValue(60)

    Tabs.Settings:AddParagraph({
        Title = "WARNING",
        Content = "It is not recommended to set at 80 on Jump."
    })

    Tabs.Teleports:AddParagraph({
        Title = "Info",
        Content = "Get secret items that will help you in your progression."
    })

    Tabs.Teleports:AddButton({
        Title = "Go to Friren's staff",
        Description = "This button will send you to fetch Friren's Staff.",
        Callback = function()
            wait(0.01)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.frierenStaff, 0)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.frierenStaff, 1)
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Get The Fallen Bracelet",
        Description = "This button will get you Fallen Bracelet.",
        Callback = function()
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.secretBracelet, 0)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.secretBracelet, 1)
        end
    })
    
    Tabs.Teleports:AddButton({
        Title = "Get Helm of the Magic Man",
        Description = "This button will get you Helm of the Magic Man.",
        Callback = function()
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.secretHelm, 0)
            firetouchinterest(LPlayer.Character.HumanoidRootPart, cache.secretHelm, 1)    
        end
    })

    Window:SelectTab(1)


end   

end
