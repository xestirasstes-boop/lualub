--[[
    ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗    ██╗   ██╗██╗
    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝    ██║   ██║██║
    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗    ██║   ██║██║
    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║    ██║   ██║██║
    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║    ╚██████╔╝██║
    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝
    
    NexusUI v2.0 — Roblox Script UI Library
    Автор: NexusUI
    Лицензия: MIT
    
    Возможности:
      • Окна с вкладками (Tabs)
      • Уведомления (Notifications)
      • Кейбинды (Keybinds)
      • HUD элементы
      • Переключатели, ползунки, кнопки, дропдауны, поля ввода
      • Цветовой пикер
      • Темы (Dark, Light, Neon, Ocean)
      • Анимации
      • Перетаскиваемые окна
]]

local NexusUI = {}
NexusUI.__index = NexusUI

-- ╔══════════════════════════════════╗
-- ║           СЕРВИСЫ                ║
-- ╚══════════════════════════════════╝

local Players         = game:GetService("Players")
local RunService      = game:GetService("RunService")
local TweenService    = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService     = game:GetService("TextService")
local CoreGui         = game:GetService("CoreGui")
local LocalPlayer     = Players.LocalPlayer

-- ╔══════════════════════════════════╗
-- ║           ТЕМЫ                   ║
-- ╚══════════════════════════════════╝

NexusUI.Themes = {
    Dark = {
        Background       = Color3.fromRGB(15, 15, 20),
        Secondary        = Color3.fromRGB(22, 22, 30),
        Tertiary         = Color3.fromRGB(30, 30, 42),
        Accent           = Color3.fromRGB(100, 80, 255),
        AccentHover      = Color3.fromRGB(120, 100, 255),
        AccentDark       = Color3.fromRGB(60, 48, 160),
        Text             = Color3.fromRGB(230, 230, 240),
        TextDim          = Color3.fromRGB(140, 140, 160),
        TextDisabled     = Color3.fromRGB(80, 80, 100),
        Border           = Color3.fromRGB(45, 45, 65),
        Success          = Color3.fromRGB(60, 220, 130),
        Warning          = Color3.fromRGB(255, 180, 50),
        Error            = Color3.fromRGB(255, 80, 80),
        Info             = Color3.fromRGB(80, 180, 255),
        SliderFill       = Color3.fromRGB(100, 80, 255),
        ToggleOn         = Color3.fromRGB(100, 80, 255),
        ToggleOff        = Color3.fromRGB(45, 45, 65),
        Shadow           = Color3.fromRGB(0, 0, 0),
    },
    Neon = {
        Background       = Color3.fromRGB(8, 10, 18),
        Secondary        = Color3.fromRGB(12, 16, 28),
        Tertiary         = Color3.fromRGB(18, 22, 40),
        Accent           = Color3.fromRGB(0, 255, 200),
        AccentHover      = Color3.fromRGB(50, 255, 220),
        AccentDark       = Color3.fromRGB(0, 140, 110),
        Text             = Color3.fromRGB(220, 255, 250),
        TextDim          = Color3.fromRGB(120, 180, 170),
        TextDisabled     = Color3.fromRGB(60, 90, 85),
        Border           = Color3.fromRGB(0, 80, 70),
        Success          = Color3.fromRGB(0, 255, 130),
        Warning          = Color3.fromRGB(255, 220, 0),
        Error            = Color3.fromRGB(255, 60, 100),
        Info             = Color3.fromRGB(0, 200, 255),
        SliderFill       = Color3.fromRGB(0, 255, 200),
        ToggleOn         = Color3.fromRGB(0, 255, 200),
        ToggleOff        = Color3.fromRGB(18, 22, 40),
        Shadow           = Color3.fromRGB(0, 0, 0),
    },
    Ocean = {
        Background       = Color3.fromRGB(10, 18, 30),
        Secondary        = Color3.fromRGB(14, 25, 42),
        Tertiary         = Color3.fromRGB(20, 35, 58),
        Accent           = Color3.fromRGB(30, 140, 255),
        AccentHover      = Color3.fromRGB(60, 165, 255),
        AccentDark       = Color3.fromRGB(20, 90, 170),
        Text             = Color3.fromRGB(210, 230, 255),
        TextDim          = Color3.fromRGB(120, 150, 195),
        TextDisabled     = Color3.fromRGB(60, 80, 110),
        Border           = Color3.fromRGB(30, 55, 90),
        Success          = Color3.fromRGB(50, 220, 150),
        Warning          = Color3.fromRGB(255, 190, 60),
        Error            = Color3.fromRGB(255, 80, 90),
        Info             = Color3.fromRGB(80, 200, 255),
        SliderFill       = Color3.fromRGB(30, 140, 255),
        ToggleOn         = Color3.fromRGB(30, 140, 255),
        ToggleOff        = Color3.fromRGB(20, 35, 58),
        Shadow           = Color3.fromRGB(0, 0, 0),
    },
    Light = {
        Background       = Color3.fromRGB(240, 242, 248),
        Secondary        = Color3.fromRGB(225, 228, 238),
        Tertiary         = Color3.fromRGB(210, 215, 230),
        Accent           = Color3.fromRGB(90, 70, 230),
        AccentHover      = Color3.fromRGB(110, 90, 250),
        AccentDark       = Color3.fromRGB(60, 45, 160),
        Text             = Color3.fromRGB(30, 30, 50),
        TextDim          = Color3.fromRGB(90, 90, 130),
        TextDisabled     = Color3.fromRGB(160, 160, 190),
        Border           = Color3.fromRGB(190, 195, 215),
        Success          = Color3.fromRGB(30, 180, 100),
        Warning          = Color3.fromRGB(220, 150, 20),
        Error            = Color3.fromRGB(210, 50, 50),
        Info             = Color3.fromRGB(40, 140, 220),
        SliderFill       = Color3.fromRGB(90, 70, 230),
        ToggleOn         = Color3.fromRGB(90, 70, 230),
        ToggleOff        = Color3.fromRGB(190, 195, 215),
        Shadow           = Color3.fromRGB(150, 150, 180),
    },
}

-- ╔══════════════════════════════════╗
-- ║         УТИЛИТЫ                  ║
-- ╚══════════════════════════════════╝

local function Tween(obj, props, time, style, direction)
    local info = TweenInfo.new(
        time or 0.2,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local function MakeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragStart, startPos = false, nil, nil
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

local function Create(class, props, children)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then
            obj[k] = v
        end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = obj
    end
    if props and props.Parent then
        obj.Parent = props.Parent
    end
    return obj
end

local function AddCorner(parent, radius)
    return Create("UICorner", { CornerRadius = UDim.new(0, radius or 8), Parent = parent })
end

local function AddStroke(parent, color, thickness)
    return Create("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        Parent = parent
    })
end

local function AddPadding(parent, top, right, bottom, left)
    return Create("UIPadding", {
        PaddingTop    = UDim.new(0, top    or 8),
        PaddingRight  = UDim.new(0, right  or 8),
        PaddingBottom = UDim.new(0, bottom or 8),
        PaddingLeft   = UDim.new(0, left   or 8),
        Parent        = parent
    })
end

local function GetTextSize(text, fontSize, font, frameSize)
    return TextService:GetTextSize(text, fontSize, font, frameSize or Vector2.new(1000, 1000))
end

-- ╔══════════════════════════════════╗
-- ║         ИНИЦИАЛИЗАЦИЯ            ║
-- ╚══════════════════════════════════╝

function NexusUI.new(config)
    local self = setmetatable({}, NexusUI)

    config = config or {}
    self.Theme        = NexusUI.Themes[config.Theme or "Dark"]
    self.ThemeName    = config.Theme or "Dark"
    self.Windows      = {}
    self.Notifications = {}
    self.Keybinds     = {}
    self.HUDElements  = {}
    self._notifCount  = 0

    -- Создаём ScreenGui
    self.ScreenGui = Create("ScreenGui", {
        Name            = config.Name or "NexusUI",
        ZIndexBehavior  = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn    = false,
        DisplayOrder    = 999,
    })

    -- Пробуем разные варианты вставки GUI
    pcall(function()
        self.ScreenGui.Parent = CoreGui
    end)
    if not self.ScreenGui.Parent then
        pcall(function()
            self.ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        end)
    end

    -- Контейнер уведомлений
    self.NotifContainer = Create("Frame", {
        Name             = "NotifContainer",
        Size             = UDim2.new(0, 320, 1, 0),
        Position         = UDim2.new(1, -330, 0, 10),
        BackgroundTransparency = 1,
        Parent           = self.ScreenGui,
    })
    Create("UIListLayout", {
        FillDirection    = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder        = Enum.SortOrder.LayoutOrder,
        Padding          = UDim.new(0, 8),
        Parent           = self.NotifContainer,
    })

    -- Контейнер HUD
    self.HUDContainer = Create("Frame", {
        Name             = "HUDContainer",
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Parent           = self.ScreenGui,
    })

    -- Кейбинды слушатель
    self._keybindConn = UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        for _, kb in pairs(self.Keybinds) do
            if kb.Key == input.KeyCode then
                pcall(kb.Callback)
            end
        end
    end)

    return self
end

-- ╔══════════════════════════════════╗
-- ║       УВЕДОМЛЕНИЯ                ║
-- ╚══════════════════════════════════╝

function NexusUI:Notify(config)
    config = config or {}
    local title    = config.Title   or "Уведомление"
    local message  = config.Message or ""
    local type_    = config.Type    or "Info"  -- Info, Success, Warning, Error
    local duration = config.Duration or 5
    local T        = self.Theme

    local typeColors = {
        Info    = T.Info,
        Success = T.Success,
        Warning = T.Warning,
        Error   = T.Error,
    }
    local typeIcons = {
        Info    = "ℹ",
        Success = "✓",
        Warning = "⚠",
        Error   = "✕",
    }

    local accentColor = typeColors[type_] or T.Info
    self._notifCount = self._notifCount + 1

    -- Основной фрейм
    local notif = Create("Frame", {
        Name             = "Notif_" .. self._notifCount,
        Size             = UDim2.new(1, 0, 0, 0),
        BackgroundColor3 = T.Secondary,
        ClipsDescendants = true,
        LayoutOrder      = self._notifCount,
        Parent           = self.NotifContainer,
    })
    AddCorner(notif, 10)
    AddStroke(notif, T.Border, 1)

    -- Акцентная полоса слева
    local bar = Create("Frame", {
        Name             = "Bar",
        Size             = UDim2.new(0, 3, 1, 0),
        BackgroundColor3 = accentColor,
        BorderSizePixel  = 0,
        Parent           = notif,
    })
    AddCorner(bar, 3)

    -- Иконка
    local icon = Create("TextLabel", {
        Name             = "Icon",
        Size             = UDim2.new(0, 28, 0, 28),
        Position         = UDim2.new(0, 14, 0, 12),
        BackgroundColor3 = accentColor,
        BackgroundTransparency = 0.85,
        Text             = typeIcons[type_] or "ℹ",
        TextColor3       = accentColor,
        TextSize         = 14,
        Font             = Enum.Font.GothamBold,
        Parent           = notif,
    })
    AddCorner(icon, 6)

    -- Заголовок
    Create("TextLabel", {
        Name             = "Title",
        Size             = UDim2.new(1, -90, 0, 18),
        Position         = UDim2.new(0, 52, 0, 10),
        BackgroundTransparency = 1,
        Text             = title,
        TextColor3       = T.Text,
        TextSize         = 13,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        Parent           = notif,
    })

    -- Сообщение
    local msgLabel = Create("TextLabel", {
        Name             = "Message",
        Size             = UDim2.new(1, -90, 0, 40),
        Position         = UDim2.new(0, 52, 0, 30),
        BackgroundTransparency = 1,
        Text             = message,
        TextColor3       = T.TextDim,
        TextSize         = 12,
        Font             = Enum.Font.Gotham,
        TextXAlignment   = Enum.TextXAlignment.Left,
        TextYAlignment   = Enum.TextYAlignment.Top,
        TextWrapped      = true,
        Parent           = notif,
    })

    -- Прогресс-бар
    local progressBG = Create("Frame", {
        Name             = "ProgressBG",
        Size             = UDim2.new(1, -8, 0, 2),
        Position         = UDim2.new(0, 4, 1, -4),
        BackgroundColor3 = T.Border,
        Parent           = notif,
    })
    AddCorner(progressBG, 2)
    local progress = Create("Frame", {
        Name             = "Progress",
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = accentColor,
        Parent           = progressBG,
    })
    AddCorner(progress, 2)

    -- Кнопка закрытия
    local closeBtn = Create("TextButton", {
        Name             = "Close",
        Size             = UDim2.new(0, 20, 0, 20),
        Position         = UDim2.new(1, -26, 0, 8),
        BackgroundTransparency = 1,
        Text             = "×",
        TextColor3       = T.TextDim,
        TextSize         = 18,
        Font             = Enum.Font.GothamBold,
        Parent           = notif,
    })

    -- Вычисляем нужную высоту
    local textH = GetTextSize(message, 12, Enum.Font.Gotham, Vector2.new(230, 1000)).Y
    local totalH = math.max(70, 48 + textH + 8)

    -- Анимация появления
    notif.Size = UDim2.new(1, 0, 0, 0)
    Tween(notif, { Size = UDim2.new(1, 0, 0, totalH) }, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    -- Прогресс анимация
    task.delay(0.3, function()
        Tween(progress, { Size = UDim2.new(0, 0, 1, 0) }, duration, Enum.EasingStyle.Linear)
    end)

    -- Функция закрытия
    local closed = false
    local function closeNotif()
        if closed then return end
        closed = true
        Tween(notif, { Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1 }, 0.25)
        task.delay(0.3, function()
            notif:Destroy()
        end)
    end

    closeBtn.MouseButton1Click:Connect(closeNotif)
    task.delay(duration, closeNotif)

    -- Hover эффект
    notif.MouseEnter:Connect(function()
        Tween(notif, { BackgroundColor3 = T.Tertiary }, 0.15)
    end)
    notif.MouseLeave:Connect(function()
        Tween(notif, { BackgroundColor3 = T.Secondary }, 0.15)
    end)

    return notif
end

-- ╔══════════════════════════════════╗
-- ║         КЕЙБИНДЫ                 ║
-- ╚══════════════════════════════════╝

function NexusUI:AddKeybind(config)
    config = config or {}
    local id       = config.Id       or ("kb_" .. #self.Keybinds + 1)
    local key      = config.Key      or Enum.KeyCode.F
    local callback = config.Callback or function() end
    local desc     = config.Description or "Кейбинд"

    self.Keybinds[id] = { Key = key, Callback = callback, Description = desc }

    return {
        SetKey = function(_, newKey)
            self.Keybinds[id].Key = newKey
        end,
        Remove = function()
            self.Keybinds[id] = nil
        end
    }
end

-- ╔══════════════════════════════════╗
-- ║         HUD ЭЛЕМЕНТЫ             ║
-- ╚══════════════════════════════════╝

function NexusUI:CreateHUD(config)
    config = config or {}
    local T     = self.Theme
    local x     = config.X or UDim2.new(0, 10, 0, 10)
    local title = config.Title or "HUD"

    local hudFrame = Create("Frame", {
        Name             = config.Name or "HUDFrame",
        Size             = UDim2.new(0, 200, 0, 0),
        Position         = x,
        BackgroundColor3 = T.Background,
        BackgroundTransparency = 0.15,
        AutomaticSize    = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        Parent           = self.HUDContainer,
    })
    AddCorner(hudFrame, 10)
    AddStroke(hudFrame, T.Border, 1)

    -- Акцент-полоса сверху
    local topBar = Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = T.Accent,
        BorderSizePixel  = 0,
        Parent           = hudFrame,
    })

    local list = Create("UIListLayout", {
        FillDirection    = Enum.FillDirection.Vertical,
        SortOrder        = Enum.SortOrder.LayoutOrder,
        Padding          = UDim.new(0, 0),
        Parent           = hudFrame,
    })

    -- Заголовок HUD
    local header = Create("TextLabel", {
        Name             = "Header",
        Size             = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Text             = "  " .. title,
        TextColor3       = T.TextDim,
        TextSize         = 11,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        LayoutOrder      = 1,
        Parent           = hudFrame,
    })

    local hud = { Frame = hudFrame, Items = {}, _order = 2 }

    -- Добавить строку HUD
    function hud:AddItem(itemConfig)
        itemConfig = itemConfig or {}
        local label = itemConfig.Label or "Параметр"
        local value = itemConfig.Value or "—"

        local row = Create("Frame", {
            Size             = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            LayoutOrder      = self._order,
            Parent           = hudFrame,
        })
        self._order = self._order + 1
        AddPadding(row, 0, 10, 0, 10)

        local labelL = Create("TextLabel", {
            Size             = UDim2.new(0.5, -5, 1, 0),
            BackgroundTransparency = 1,
            Text             = label,
            TextColor3       = T.TextDim,
            TextSize         = 11,
            Font             = Enum.Font.Gotham,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = row,
        })
        local valueL = Create("TextLabel", {
            Size             = UDim2.new(0.5, -5, 1, 0),
            Position         = UDim2.new(0.5, 5, 0, 0),
            BackgroundTransparency = 1,
            Text             = tostring(value),
            TextColor3       = T.Accent,
            TextSize         = 11,
            Font             = Enum.Font.GothamBold,
            TextXAlignment   = Enum.TextXAlignment.Right,
            Parent           = row,
        })

        local item = {
            Row    = row,
            Label  = labelL,
            Value  = valueL,
            Set    = function(_, val)
                valueL.Text = tostring(val)
            end,
            SetColor = function(_, col)
                valueL.TextColor3 = col
            end,
            Remove = function()
                row:Destroy()
            end
        }
        table.insert(self.Items, item)
        return item
    end

    -- Добавить разделитель
    function hud:AddSeparator()
        local sep = Create("Frame", {
            Size             = UDim2.new(1, -16, 0, 1),
            Position         = UDim2.new(0, 8, 0, 0),
            BackgroundColor3 = T.Border,
            BorderSizePixel  = 0,
            LayoutOrder      = self._order,
            Parent           = hudFrame,
        })
        self._order = self._order + 1
        return sep
    end

    function hud:Toggle()
        hudFrame.Visible = not hudFrame.Visible
    end
    function hud:Destroy()
        hudFrame:Destroy()
    end

    MakeDraggable(hudFrame)
    table.insert(self.HUDElements, hud)
    return hud
end

-- ╔══════════════════════════════════╗
-- ║          ОКНА                    ║
-- ╚══════════════════════════════════╝

function NexusUI:CreateWindow(config)
    config = config or {}
    local T         = self.Theme
    local title     = config.Title    or "NexusUI"
    local subtitle  = config.Subtitle or ""
    local width     = config.Width    or 560
    local height    = config.Height   or 400
    local position  = config.Position or UDim2.new(0.5, -width/2, 0.5, -height/2)
    local toggleKey = config.ToggleKey or Enum.KeyCode.RightShift

    -- ── Главный фрейм ──
    local mainFrame = Create("Frame", {
        Name             = "Window",
        Size             = UDim2.new(0, width, 0, height),
        Position         = position,
        BackgroundColor3 = T.Background,
        ClipsDescendants = false,
        Parent           = self.ScreenGui,
    })
    AddCorner(mainFrame, 12)

    -- Тень
    local shadow = Create("ImageLabel", {
        Name             = "Shadow",
        Size             = UDim2.new(1, 40, 1, 40),
        Position         = UDim2.new(0, -20, 0, 10),
        BackgroundTransparency = 1,
        Image            = "rbxassetid://6014261993",
        ImageColor3      = T.Shadow,
        ImageTransparency = 0.5,
        ScaleType        = Enum.ScaleType.Slice,
        SliceCenter      = Rect.new(49, 49, 450, 450),
        ZIndex           = -1,
        Parent           = mainFrame,
    })

    -- Основная обводка
    AddStroke(mainFrame, T.Border, 1)

    -- ── Шапка ──
    local header = Create("Frame", {
        Name             = "Header",
        Size             = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = T.Secondary,
        ClipsDescendants = true,
        Parent           = mainFrame,
    })
    -- Закруглить только верх шапки
    Create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = header })
    Create("Frame", {
        Size             = UDim2.new(1, 0, 0.5, 0),
        Position         = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = T.Secondary,
        BorderSizePixel  = 0,
        Parent           = header,
    })

    -- Акцентная линия под шапкой
    Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 1),
        Position         = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = T.Border,
        BorderSizePixel  = 0,
        Parent           = header,
    })

    -- Логотип / акцент-точка
    local dot = Create("Frame", {
        Size             = UDim2.new(0, 8, 0, 8),
        Position         = UDim2.new(0, 16, 0.5, -4),
        BackgroundColor3 = T.Accent,
        Parent           = header,
    })
    AddCorner(dot, 4)

    -- Заголовок
    Create("TextLabel", {
        Name             = "Title",
        Size             = UDim2.new(0, 200, 1, 0),
        Position         = UDim2.new(0, 32, 0, 0),
        BackgroundTransparency = 1,
        Text             = title,
        TextColor3       = T.Text,
        TextSize         = 15,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        Parent           = header,
    })

    -- Субтитул
    if subtitle ~= "" then
        Create("TextLabel", {
            Name             = "Subtitle",
            Size             = UDim2.new(0, 200, 1, 0),
            Position         = UDim2.new(0, 32 + GetTextSize(title, 15, Enum.Font.GothamBold).X + 8, 0, 0),
            BackgroundTransparency = 1,
            Text             = subtitle,
            TextColor3       = T.TextDim,
            TextSize         = 12,
            Font             = Enum.Font.Gotham,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = header,
        })
    end

    -- Кнопки управления
    local ctrlContainer = Create("Frame", {
        Size             = UDim2.new(0, 80, 0, 24),
        Position         = UDim2.new(1, -90, 0.5, -12),
        BackgroundTransparency = 1,
        Parent           = header,
    })
    Create("UIListLayout", {
        FillDirection    = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment   = Enum.VerticalAlignment.Center,
        Padding          = UDim.new(0, 6),
        Parent           = ctrlContainer,
    })

    local function MakeCtrlBtn(icon, color)
        local btn = Create("TextButton", {
            Size             = UDim2.new(0, 24, 0, 24),
            BackgroundColor3 = T.Tertiary,
            Text             = icon,
            TextColor3       = color or T.TextDim,
            TextSize         = 12,
            Font             = Enum.Font.GothamBold,
            Parent           = ctrlContainer,
        })
        AddCorner(btn, 6)
        btn.MouseEnter:Connect(function()
            Tween(btn, { BackgroundColor3 = color or T.Accent, TextColor3 = T.Text }, 0.12)
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, { BackgroundColor3 = T.Tertiary, TextColor3 = color or T.TextDim }, 0.12)
        end)
        return btn
    end

    local minimizeBtn = MakeCtrlBtn("─", T.Warning)
    local closeBtn    = MakeCtrlBtn("×", T.Error)

    -- ── Боковая панель вкладок ──
    local sidebar = Create("Frame", {
        Name             = "Sidebar",
        Size             = UDim2.new(0, 140, 1, -52),
        Position         = UDim2.new(0, 0, 0, 52),
        BackgroundColor3 = T.Secondary,
        Parent           = mainFrame,
    })
    -- Скруглить нижний левый угол
    Create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = sidebar })
    Create("Frame", {
        Size             = UDim2.new(0.5, 0, 1, 0),
        Position         = UDim2.new(0.5, 0, 0, 0),
        BackgroundColor3 = T.Secondary,
        BorderSizePixel  = 0,
        Parent           = sidebar,
    })
    Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 0.5),
        BackgroundColor3 = T.Secondary,
        BorderSizePixel  = 0,
        Parent           = sidebar,
    })

    -- Разделитель sidebar | content
    Create("Frame", {
        Size             = UDim2.new(0, 1, 1, -52),
        Position         = UDim2.new(0, 140, 0, 52),
        BackgroundColor3 = T.Border,
        BorderSizePixel  = 0,
        Parent           = mainFrame,
    })

    local tabList = Create("UIListLayout", {
        FillDirection    = Enum.FillDirection.Vertical,
        SortOrder        = Enum.SortOrder.LayoutOrder,
        Padding          = UDim.new(0, 4),
        Parent           = sidebar,
    })
    AddPadding(sidebar, 10, 8, 10, 8)

    -- ── Область контента ──
    local contentArea = Create("Frame", {
        Name             = "ContentArea",
        Size             = UDim2.new(1, -141, 1, -52),
        Position         = UDim2.new(0, 141, 0, 52),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = mainFrame,
    })

    -- Перетаскивание
    MakeDraggable(mainFrame, header)

    -- Анимация появления
    mainFrame.Size = UDim2.new(0, width, 0, 0)
    mainFrame.BackgroundTransparency = 1
    Tween(mainFrame, { Size = UDim2.new(0, width, 0, height), BackgroundTransparency = 0 }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    -- ── Объект окна ──
    local window = {
        Frame       = mainFrame,
        Header      = header,
        Sidebar     = sidebar,
        ContentArea = contentArea,
        Tabs        = {},
        ActiveTab   = nil,
        Theme       = T,
        Library     = self,
        _visible    = true,
    }

    -- Минимизация
    local minimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(mainFrame, { Size = UDim2.new(0, width, 0, 52) }, 0.3, Enum.EasingStyle.Quart)
        else
            Tween(mainFrame, { Size = UDim2.new(0, width, 0, height) }, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        end
    end)

    -- Закрытие
    closeBtn.MouseButton1Click:Connect(function()
        Tween(mainFrame, { Size = UDim2.new(0, width, 0, 0), BackgroundTransparency = 1 }, 0.3)
        task.delay(0.35, function()
            mainFrame:Destroy()
        end)
    end)

    -- Кейбинд переключения
    if toggleKey then
        self:AddKeybind({
            Id       = "window_toggle_" .. title,
            Key      = toggleKey,
            Callback = function()
                window._visible = not window._visible
                if window._visible then
                    mainFrame.Visible = true
                    Tween(mainFrame, { Size = UDim2.new(0, width, 0, height), BackgroundTransparency = 0 }, 0.3, Enum.EasingStyle.Back)
                else
                    Tween(mainFrame, { Size = UDim2.new(0, width, 0, 0), BackgroundTransparency = 1 }, 0.2)
                    task.delay(0.25, function()
                        if not window._visible then
                            mainFrame.Visible = false
                        end
                    end)
                end
            end
        })
    end

    -- ╔══════════════════════╗
    -- ║   СОЗДАНИЕ ВКЛАДКИ   ║
    -- ╚══════════════════════╝
    function window:AddTab(tabConfig)
        tabConfig = tabConfig or {}
        local tabName = tabConfig.Name or ("Вкладка " .. #self.Tabs + 1)
        local tabIcon = tabConfig.Icon or ""

        -- Кнопка вкладки
        local tabBtn = Create("TextButton", {
            Name             = "Tab_" .. tabName,
            Size             = UDim2.new(1, 0, 0, 34),
            BackgroundColor3 = T.Tertiary,
            BackgroundTransparency = 1,
            Text             = "",
            LayoutOrder      = #self.Tabs + 1,
            Parent           = sidebar,
        })
        AddCorner(tabBtn, 8)
        AddPadding(tabBtn, 0, 8, 0, 8)

        -- Акцент-полоска активной вкладки
        local activeBar = Create("Frame", {
            Size             = UDim2.new(0, 3, 0.6, 0),
            Position         = UDim2.new(0, -8, 0.2, 0),
            BackgroundColor3 = T.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            Parent           = tabBtn,
        })
        AddCorner(activeBar, 2)

        local tabLabel = Create("TextLabel", {
            Size             = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text             = (tabIcon ~= "" and tabIcon .. "  " or "") .. tabName,
            TextColor3       = T.TextDim,
            TextSize         = 12,
            Font             = Enum.Font.Gotham,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = tabBtn,
        })

        -- Контент вкладки
        local tabContent = Create("ScrollingFrame", {
            Name             = "Content_" .. tabName,
            Size             = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = T.Accent,
            CanvasSize       = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible          = false,
            Parent           = contentArea,
        })
        Create("UIListLayout", {
            FillDirection    = Enum.FillDirection.Vertical,
            SortOrder        = Enum.SortOrder.LayoutOrder,
            Padding          = UDim.new(0, 6),
            Parent           = tabContent,
        })
        AddPadding(tabContent, 10, 14, 10, 14)

        local tab = {
            Button  = tabBtn,
            Content = tabContent,
            Name    = tabName,
            _order  = 0,
        }

        -- Активация вкладки
        local function activate()
            -- Деактивировать все
            for _, t in pairs(self.Tabs) do
                Tween(t.Button, { BackgroundTransparency = 1 }, 0.15)
                local ab = t.Button:FindFirstChild("Frame")
                if ab then Tween(ab, { BackgroundTransparency = 1 }, 0.15) end
                t.Button:FindFirstChild("TextLabel").TextColor3 = T.TextDim
                t.Button:FindFirstChild("TextLabel").Font = Enum.Font.Gotham
                t.Content.Visible = false
            end
            -- Активировать текущую
            Tween(tabBtn, { BackgroundTransparency = 0.85, BackgroundColor3 = T.Accent }, 0.15)
            Tween(activeBar, { BackgroundTransparency = 0 }, 0.15)
            tabLabel.TextColor3 = T.Text
            tabLabel.Font = Enum.Font.GothamBold
            tabContent.Visible = true
            self.ActiveTab = tab
        end

        tabBtn.MouseButton1Click:Connect(activate)
        tabBtn.MouseEnter:Connect(function()
            if self.ActiveTab ~= tab then
                Tween(tabBtn, { BackgroundTransparency = 0.92, BackgroundColor3 = T.Tertiary }, 0.12)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if self.ActiveTab ~= tab then
                Tween(tabBtn, { BackgroundTransparency = 1 }, 0.12)
            end
        end)

        table.insert(self.Tabs, tab)
        if #self.Tabs == 1 then activate() end

        -- ╔══════════════════════╗
        -- ║  ЭЛЕМЕНТЫ ВКЛАДКИ    ║
        -- ╚══════════════════════╝

        -- Секция (группа элементов)
        function tab:AddSection(sectionConfig)
            sectionConfig = sectionConfig or {}
            local sName = sectionConfig.Name or "Секция"
            self._order = self._order + 1

            local section = Create("Frame", {
                Name             = "Section_" .. sName,
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundColor3 = T.Secondary,
                LayoutOrder      = self._order,
                Parent           = tabContent,
            })
            AddCorner(section, 10)
            AddStroke(section, T.Border, 1)

            local sectionList = Create("UIListLayout", {
                FillDirection    = Enum.FillDirection.Vertical,
                SortOrder        = Enum.SortOrder.LayoutOrder,
                Padding          = UDim.new(0, 4),
                Parent           = section,
            })
            AddPadding(section, 8, 10, 8, 10)

            -- Заголовок секции
            local headerRow = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                LayoutOrder      = -1,
                Parent           = section,
            })
            local sectionLine = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 1),
                Position         = UDim2.new(0, 0, 1, 2),
                BackgroundColor3 = T.Border,
                BorderSizePixel  = 0,
                Parent           = headerRow,
            })
            Create("TextLabel", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = sName:upper(),
                TextColor3       = T.Accent,
                TextSize         = 10,
                Font             = Enum.Font.GothamBold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = headerRow,
            })

            local sec = { Frame = section, _order = 0 }

            -- ── КНОПКА ──
            function sec:AddButton(bConfig)
                bConfig = bConfig or {}
                self._order = self._order + 1
                local btn = Create("TextButton", {
                    Size             = UDim2.new(1, 0, 0, 34),
                    BackgroundColor3 = T.Tertiary,
                    Text             = "",
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(btn, 8)
                AddPadding(btn, 0, 10, 0, 10)
                Create("TextLabel", {
                    Size             = UDim2.new(1, -20, 1, 0),
                    BackgroundTransparency = 1,
                    Text             = bConfig.Name or "Кнопка",
                    TextColor3       = T.Text,
                    TextSize         = 13,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Parent           = btn,
                })
                Create("TextLabel", {
                    Size             = UDim2.new(0, 20, 1, 0),
                    Position         = UDim2.new(1, -20, 0, 0),
                    BackgroundTransparency = 1,
                    Text             = "›",
                    TextColor3       = T.TextDim,
                    TextSize         = 16,
                    Font             = Enum.Font.GothamBold,
                    Parent           = btn,
                })
                btn.MouseEnter:Connect(function()
                    Tween(btn, { BackgroundColor3 = T.Accent }, 0.15)
                    btn:FindFirstChildWhichIsA("TextLabel").TextColor3 = T.Text
                end)
                btn.MouseLeave:Connect(function()
                    Tween(btn, { BackgroundColor3 = T.Tertiary }, 0.15)
                end)
                btn.MouseButton1Click:Connect(function()
                    Tween(btn, { BackgroundColor3 = T.AccentDark }, 0.05)
                    task.delay(0.12, function()
                        Tween(btn, { BackgroundColor3 = T.Tertiary }, 0.15)
                    end)
                    pcall(bConfig.Callback or function() end)
                end)
                return btn
            end

            -- ── ПЕРЕКЛЮЧАТЕЛЬ ──
            function sec:AddToggle(tConfig)
                tConfig = tConfig or {}
                self._order = self._order + 1
                local state = tConfig.Default or false

                local row = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 34),
                    BackgroundColor3 = T.Tertiary,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(row, 8)
                AddPadding(row, 0, 10, 0, 10)

                Create("TextLabel", {
                    Size             = UDim2.new(1, -52, 1, 0),
                    BackgroundTransparency = 1,
                    Text             = tConfig.Name or "Переключатель",
                    TextColor3       = T.Text,
                    TextSize         = 13,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Parent           = row,
                })

                -- Фон переключателя
                local toggleBG = Create("Frame", {
                    Size             = UDim2.new(0, 40, 0, 20),
                    Position         = UDim2.new(1, -40, 0.5, -10),
                    BackgroundColor3 = state and T.ToggleOn or T.ToggleOff,
                    Parent           = row,
                })
                AddCorner(toggleBG, 10)
                AddStroke(toggleBG, T.Border, 1)

                -- Круг
                local toggleDot = Create("Frame", {
                    Size             = UDim2.new(0, 14, 0, 14),
                    Position         = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent           = toggleBG,
                })
                AddCorner(toggleDot, 8)

                local togObj = { Value = state }

                local function updateToggle()
                    if togObj.Value then
                        Tween(toggleBG, { BackgroundColor3 = T.ToggleOn }, 0.2)
                        Tween(toggleDot, { Position = UDim2.new(1, -17, 0.5, -7) }, 0.2, Enum.EasingStyle.Back)
                    else
                        Tween(toggleBG, { BackgroundColor3 = T.ToggleOff }, 0.2)
                        Tween(toggleDot, { Position = UDim2.new(0, 3, 0.5, -7) }, 0.2, Enum.EasingStyle.Back)
                    end
                end

                row.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        togObj.Value = not togObj.Value
                        updateToggle()
                        pcall(tConfig.Callback or function() end, togObj.Value)
                    end
                end)
                row.MouseEnter:Connect(function()
                    Tween(row, { BackgroundColor3 = T.Background }, 0.15)
                end)
                row.MouseLeave:Connect(function()
                    Tween(row, { BackgroundColor3 = T.Tertiary }, 0.15)
                end)

                function togObj:Set(val)
                    self.Value = val
                    updateToggle()
                end

                return togObj
            end

            -- ── СЛАЙДЕР ──
            function sec:AddSlider(sConfig)
                sConfig = sConfig or {}
                self._order = self._order + 1
                local min   = sConfig.Min     or 0
                local max   = sConfig.Max     or 100
                local step  = sConfig.Step    or 1
                local value = sConfig.Default or min
                local suffix = sConfig.Suffix or ""

                local frame = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 50),
                    BackgroundColor3 = T.Tertiary,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(frame, 8)
                AddPadding(frame, 8, 10, 8, 10)

                local topRow = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 18),
                    BackgroundTransparency = 1,
                    Parent           = frame,
                })
                Create("TextLabel", {
                    Size             = UDim2.new(0.7, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text             = sConfig.Name or "Слайдер",
                    TextColor3       = T.Text,
                    TextSize         = 13,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Parent           = topRow,
                })
                local valLabel = Create("TextLabel", {
                    Size             = UDim2.new(0.3, 0, 1, 0),
                    Position         = UDim2.new(0.7, 0, 0, 0),
                    BackgroundTransparency = 1,
                    Text             = tostring(value) .. suffix,
                    TextColor3       = T.Accent,
                    TextSize         = 13,
                    Font             = Enum.Font.GothamBold,
                    TextXAlignment   = Enum.TextXAlignment.Right,
                    Parent           = topRow,
                })

                -- Трек слайдера
                local track = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 6),
                    Position         = UDim2.new(0, 0, 1, -6),
                    BackgroundColor3 = T.Background,
                    Parent           = frame,
                })
                AddCorner(track, 3)

                -- Заполнение
                local pct = (value - min) / (max - min)
                local fill = Create("Frame", {
                    Size             = UDim2.new(pct, 0, 1, 0),
                    BackgroundColor3 = T.SliderFill,
                    Parent           = track,
                })
                AddCorner(fill, 3)

                -- Ползунок-точка
                local thumb = Create("Frame", {
                    Size             = UDim2.new(0, 14, 0, 14),
                    Position         = UDim2.new(pct, -7, 0.5, -7),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent           = track,
                })
                AddCorner(thumb, 8)
                AddStroke(thumb, T.Accent, 2)

                local slObj = { Value = value }
                local draggingSlider = false

                local function updateSlider(x)
                    local tPos = track.AbsolutePosition.X
                    local tSize = track.AbsoluteSize.X
                    local p = math.clamp((x - tPos) / tSize, 0, 1)
                    local raw = min + (max - min) * p
                    local stepped = math.round(raw / step) * step
                    stepped = math.clamp(stepped, min, max)
                    slObj.Value = stepped
                    local pctNew = (stepped - min) / (max - min)
                    fill.Size    = UDim2.new(pctNew, 0, 1, 0)
                    thumb.Position = UDim2.new(pctNew, -7, 0.5, -7)
                    valLabel.Text = tostring(stepped) .. suffix
                    pcall(sConfig.Callback or function() end, stepped)
                end

                track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSlider = true
                        updateSlider(input.Position.X)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider(input.Position.X)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSlider = false
                    end
                end)

                frame.MouseEnter:Connect(function()
                    Tween(frame, { BackgroundColor3 = T.Background }, 0.15)
                end)
                frame.MouseLeave:Connect(function()
                    Tween(frame, { BackgroundColor3 = T.Tertiary }, 0.15)
                end)

                function slObj:Set(val)
                    self.Value = math.clamp(val, min, max)
                    local p2 = (self.Value - min) / (max - min)
                    fill.Size      = UDim2.new(p2, 0, 1, 0)
                    thumb.Position = UDim2.new(p2, -7, 0.5, -7)
                    valLabel.Text  = tostring(self.Value) .. suffix
                end

                return slObj
            end

            -- ── ДРОПДАУН ──
            function sec:AddDropdown(dConfig)
                dConfig = dConfig or {}
                self._order = self._order + 1
                local options = dConfig.Options or {}
                local selected = dConfig.Default or (options[1] or "")
                local isOpen = false

                local frame = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 34),
                    BackgroundColor3 = T.Tertiary,
                    ClipsDescendants = false,
                    ZIndex           = 10,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(frame, 8)

                Create("TextLabel", {
                    Size             = UDim2.new(0.55, -5, 1, 0),
                    Position         = UDim2.new(0, 10, 0, 0),
                    BackgroundTransparency = 1,
                    Text             = dConfig.Name or "Дропдаун",
                    TextColor3       = T.Text,
                    TextSize         = 13,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    ZIndex           = 11,
                    Parent           = frame,
                })

                local dropBtn = Create("TextButton", {
                    Size             = UDim2.new(0.45, -10, 0, 24),
                    Position         = UDim2.new(0.55, 0, 0.5, -12),
                    BackgroundColor3 = T.Background,
                    Text             = "",
                    ZIndex           = 11,
                    Parent           = frame,
                })
                AddCorner(dropBtn, 6)
                AddStroke(dropBtn, T.Border, 1)

                local selLabel = Create("TextLabel", {
                    Size             = UDim2.new(1, -26, 1, 0),
                    Position         = UDim2.new(0, 8, 0, 0),
                    BackgroundTransparency = 1,
                    Text             = tostring(selected),
                    TextColor3       = T.Accent,
                    TextSize         = 12,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    ZIndex           = 12,
                    Parent           = dropBtn,
                })
                Create("TextLabel", {
                    Size             = UDim2.new(0, 16, 1, 0),
                    Position         = UDim2.new(1, -18, 0, 0),
                    BackgroundTransparency = 1,
                    Text             = "▾",
                    TextColor3       = T.TextDim,
                    TextSize         = 12,
                    Font             = Enum.Font.GothamBold,
                    ZIndex           = 12,
                    Parent           = dropBtn,
                })

                -- Список опций
                local dropList = Create("Frame", {
                    Size             = UDim2.new(0.45, -10, 0, 0),
                    Position         = UDim2.new(0.55, 0, 1, 4),
                    BackgroundColor3 = T.Background,
                    ClipsDescendants = true,
                    Visible          = false,
                    ZIndex           = 20,
                    Parent           = frame,
                })
                AddCorner(dropList, 8)
                AddStroke(dropList, T.Border, 1)
                Create("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding   = UDim.new(0, 2),
                    Parent    = dropList,
                })
                AddPadding(dropList, 4, 6, 4, 6)

                local ddObj = { Value = selected }

                for i, opt in ipairs(options) do
                    local optBtn = Create("TextButton", {
                        Size             = UDim2.new(1, 0, 0, 26),
                        BackgroundColor3 = T.Tertiary,
                        BackgroundTransparency = 1,
                        Text             = tostring(opt),
                        TextColor3       = T.TextDim,
                        TextSize         = 12,
                        Font             = Enum.Font.Gotham,
                        TextXAlignment   = Enum.TextXAlignment.Left,
                        ZIndex           = 21,
                        LayoutOrder      = i,
                        Parent           = dropList,
                    })
                    AddCorner(optBtn, 6)
                    AddPadding(optBtn, 0, 6, 0, 6)

                    optBtn.MouseEnter:Connect(function()
                        Tween(optBtn, { BackgroundTransparency = 0.8, BackgroundColor3 = T.Accent, TextColor3 = T.Text }, 0.1)
                    end)
                    optBtn.MouseLeave:Connect(function()
                        Tween(optBtn, { BackgroundTransparency = 1, TextColor3 = T.TextDim }, 0.1)
                    end)
                    optBtn.MouseButton1Click:Connect(function()
                        ddObj.Value = opt
                        selLabel.Text = tostring(opt)
                        isOpen = false
                        Tween(dropList, { Size = UDim2.new(0.45, -10, 0, 0) }, 0.2)
                        task.delay(0.2, function() dropList.Visible = false end)
                        pcall(dConfig.Callback or function() end, opt)
                    end)
                end

                local listH = #options * 30 + 8
                dropBtn.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        dropList.Visible = true
                        dropList.Size = UDim2.new(0.45, -10, 0, 0)
                        Tween(dropList, { Size = UDim2.new(0.45, -10, 0, listH) }, 0.25, Enum.EasingStyle.Back)
                    else
                        Tween(dropList, { Size = UDim2.new(0.45, -10, 0, 0) }, 0.2)
                        task.delay(0.2, function() dropList.Visible = false end)
                    end
                end)

                function ddObj:Set(val)
                    self.Value = val
                    selLabel.Text = tostring(val)
                end

                return ddObj
            end

            -- ── ПОЛЕ ВВОДА ──
            function sec:AddTextbox(txConfig)
                txConfig = txConfig or {}
                self._order = self._order + 1

                local frame = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 50),
                    BackgroundColor3 = T.Tertiary,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(frame, 8)
                AddPadding(frame, 6, 10, 6, 10)

                Create("TextLabel", {
                    Size             = UDim2.new(1, 0, 0, 16),
                    BackgroundTransparency = 1,
                    Text             = txConfig.Name or "Поле ввода",
                    TextColor3       = T.TextDim,
                    TextSize         = 11,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Parent           = frame,
                })

                local inputBG = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 24),
                    Position         = UDim2.new(0, 0, 1, -24),
                    BackgroundColor3 = T.Background,
                    Parent           = frame,
                })
                AddCorner(inputBG, 6)
                AddStroke(inputBG, T.Border, 1)

                local input = Create("TextBox", {
                    Size             = UDim2.new(1, -12, 1, 0),
                    Position         = UDim2.new(0, 6, 0, 0),
                    BackgroundTransparency = 1,
                    PlaceholderText  = txConfig.Placeholder or "Введите текст...",
                    PlaceholderColor3 = T.TextDisabled,
                    Text             = txConfig.Default or "",
                    TextColor3       = T.Text,
                    TextSize         = 12,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    ClearTextOnFocus = txConfig.ClearOnFocus ~= false,
                    Parent           = inputBG,
                })

                input.Focused:Connect(function()
                    Tween(inputBG, { BackgroundColor3 = T.Secondary }, 0.15)
                    AddStroke(inputBG, T.Accent, 1.5)
                end)
                input.FocusLost:Connect(function(enter)
                    Tween(inputBG, { BackgroundColor3 = T.Background }, 0.15)
                    AddStroke(inputBG, T.Border, 1)
                    if enter or txConfig.OnChange then
                        pcall(txConfig.Callback or function() end, input.Text)
                    end
                end)

                local txObj = { Value = input.Text }
                function txObj:Get() return input.Text end
                function txObj:Set(val) input.Text = tostring(val) end

                return txObj
            end

            -- ── ЛЕЙБЛ ──
            function sec:AddLabel(lConfig)
                lConfig = lConfig or {}
                self._order = self._order + 1
                local lbl = Create("TextLabel", {
                    Size             = UDim2.new(1, 0, 0, 24),
                    BackgroundTransparency = 1,
                    Text             = lConfig.Text or "",
                    TextColor3       = lConfig.Color or T.TextDim,
                    TextSize         = lConfig.Size or 12,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    TextWrapped      = true,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                return {
                    Label = lbl,
                    Set   = function(_, text) lbl.Text = text end,
                    SetColor = function(_, col) lbl.TextColor3 = col end,
                }
            end

            -- ── РАЗДЕЛИТЕЛЬ ──
            function sec:AddSeparator()
                self._order = self._order + 1
                return Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 1),
                    BackgroundColor3 = T.Border,
                    BorderSizePixel  = 0,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
            end

            -- ── КЕЙБИНД ВИДЖЕТ ──
            function sec:AddKeybindWidget(kConfig)
                kConfig = kConfig or {}
                self._order = self._order + 1
                local currentKey = kConfig.Default or Enum.KeyCode.F
                local listening  = false

                local row = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 34),
                    BackgroundColor3 = T.Tertiary,
                    LayoutOrder      = self._order,
                    Parent           = section,
                })
                AddCorner(row, 8)
                AddPadding(row, 0, 10, 0, 10)

                Create("TextLabel", {
                    Size             = UDim2.new(0.6, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text             = kConfig.Name or "Кейбинд",
                    TextColor3       = T.Text,
                    TextSize         = 13,
                    Font             = Enum.Font.Gotham,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    Parent           = row,
                })

                local keyBtn = Create("TextButton", {
                    Size             = UDim2.new(0, 70, 0, 22),
                    Position         = UDim2.new(1, -70, 0.5, -11),
                    BackgroundColor3 = T.Background,
                    Text             = currentKey.Name,
                    TextColor3       = T.Accent,
                    TextSize         = 11,
                    Font             = Enum.Font.GothamBold,
                    Parent           = row,
                })
                AddCorner(keyBtn, 6)
                AddStroke(keyBtn, T.Border, 1)

                local kbObj = { Key = currentKey }

                keyBtn.MouseButton1Click:Connect(function()
                    if listening then return end
                    listening = true
                    keyBtn.Text = "..."
                    keyBtn.TextColor3 = T.Warning
                    Tween(keyBtn, { BackgroundColor3 = T.Tertiary }, 0.1)
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input, gp)
                        if gp then return end
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            currentKey = input.KeyCode
                            kbObj.Key  = input.KeyCode
                            keyBtn.Text = input.KeyCode.Name
                            keyBtn.TextColor3 = T.Accent
                            Tween(keyBtn, { BackgroundColor3 = T.Background }, 0.1)
                            pcall(kConfig.Callback or function() end, input.KeyCode)
                            listening = false
                            conn:Disconnect()
                        end
                    end)
                end)

                return kbObj
            end

            return sec
        end -- AddSection

        return tab
    end -- AddTab

    table.insert(self.Windows, window)
    return window
end

-- ╔══════════════════════════════════╗
-- ║        СМЕНА ТЕМЫ                ║
-- ╚══════════════════════════════════╝

function NexusUI:SetTheme(themeName)
    if NexusUI.Themes[themeName] then
        self.Theme     = NexusUI.Themes[themeName]
        self.ThemeName = themeName
        self:Notify({
            Title   = "Тема изменена",
            Message = "Применена тема: " .. themeName,
            Type    = "Info",
        })
    end
end

-- ╔══════════════════════════════════╗
-- ║          ДЕСТРУКТОР              ║
-- ╚══════════════════════════════════╝

function NexusUI:Destroy()
    if self._keybindConn then
        self._keybindConn:Disconnect()
    end
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

return NexusUI