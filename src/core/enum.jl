@enum GlobalColor begin
    color0
    color1
    black
    white
    darkGray
    gray
    lightGray
    red
    green
    blue
    cyan
    magenta
    yellow
    darkRed
    darkGreen
    darkBlue
    darkCyan
    darkMagenta
    darkYellow
    transparent
end

@enum ColorScheme begin
    Unknown
    Light
    Dark
end

@enum MouseButton begin
    NoButton = 0x00000000
    LeftButton = 0x00000001
    RightButton = 0x00000002
    MiddleButton = 0x00000004
    BackButton = 0x00000008
    XButton1 = BackButton
    ExtraButton1 = XButton1
    ForwardButton = 0x00000010
    XButton2 = ForwardButton
    ExtraButton2 = ForwardButton
    TaskButton = 0x00000020
    ExtraButton3 = TaskButton
    ExtraButton4 = 0x00000040
    ExtraButton5 = 0x00000080
    ExtraButton6 = 0x00000100
    ExtraButton7 = 0x00000200
    ExtraButton8 = 0x00000400
    ExtraButton9 = 0x00000800
    ExtraButton10 = 0x00001000
    ExtraButton11 = 0x00002000
    ExtraButton12 = 0x00004000
    ExtraButton13 = 0x00008000
    ExtraButton14 = 0x00010000
    ExtraButton15 = 0x00020000
    ExtraButton16 = 0x00040000
    ExtraButton17 = 0x00080000
    ExtraButton18 = 0x00100000
    ExtraButton19 = 0x00200000
    ExtraButton20 = 0x00400000
    ExtraButton21 = 0x00800000
    ExtraButton22 = 0x01000000
    ExtraButton23 = 0x02000000
    ExtraButton24 = 0x04000000
    AllButtons = 0x07ffffff
    MaxMouseButton = ExtraButton24
    MouseButtonMask = 0xffffffff
end

@enum Orientation begin
    Horizontal = 0x1
    Vertical = 0x2
end

@enum FocusPolicy begin
    NoFocus = 0
    TabFocus = 0x1
    ClickFocus = 0x2
    StrongFocus = TabFocus | ClickFocus | 0x8
    WheelFocus = StrongFocus | 0x4
end

@enum TabFocusBehavior begin
    NoTabFocus = 0x00
    TabFocusTextControls = 0x01
    TabFocusListControls = 0x02
    TabFocusAllControls = 0xff
end

@enum SortOrder begin
    AscendingOrder
    DescendingOrder
end

@enum SplitBehaviorFlags begin
    KeepEmptyParts = 0
    SkipEmptyParts = 0x1
end

@enum TileRule begin
    StretchTile
    RepeatTile
    RoundTile
end

@enum AlignmentFlag begin
    AlignLeft = 0x0001
    AlignLeading = AlignLeft
    AlignRight = 0x0002
    AlignTrailing = AlignRight
    AlignHCenter = 0x0004
    AlignJustify = 0x0008
    AlignAbsolute = 0x0010
    AlignHorizontal_Mask = AlignLeft | AlignRight | AlignHCenter | AlignJustify | AlignAbsolute

    AlignTop = 0x0020
    AlignBottom = 0x0040
    AlignVCenter = 0x0080
    AlignBaseline = 0x0100
    AlignVertical_Mask = AlignTop | AlignBottom | AlignVCenter | AlignBaseline

    AlignCenter = AlignVCenter | AlignHCenter
end

@enum TextFlag begin
    TextSingleLine = 0x0100
    TextDontClip = 0x0200
    TextExpandTabs = 0x0400
    TextShowMnemonic = 0x0800
    TextWordWrap = 0x1000
    TextWrapAnywhere = 0x2000
    TextDontPrint = 0x4000
    TextIncludeTrailingSpaces = 0x08000000
    TextHideMnemonic = 0x8000
    TextJustificationForced = 0x10000
    TextForceLeftToRight = 0x20000
    TextForceRightToLeft = 0x40000
    TextLongestVariant = 0x80000
end

@enum TextElideMode begin
    ElideLeft
    ElideRight
    ElideMiddle
    ElideNone
end

@enum WhiteSpaceMode begin
    WhiteSpaceNormal
    WhiteSpacePre
    WhiteSpaceNoWrap
    WhiteSpaceModeUndefined = -1
end

@enum HitTestAccuracy begin
    ExactHit
    FuzzyHit
end

@enum WindowType begin
    Widget = 0x00000000
    Window = 0x00000001
    Dialog = 0x00000002 | Window
    Sheet = 0x00000004 | Window
    Drawer = Sheet | Dialog
    Popup = 0x00000008 | Window
    Tool = Popup | Dialog
    ToolTip = Popup | Sheet
    SplashScreen = ToolTip | Dialog
    Desktop = 0x00000010 | Window
    SubWindow = 0x00000012
    ForeignWindow = 0x00000020 | Window
    CoverWindow = 0x00000040 | Window

    WindowType_Mask = 0x000000ff
    MSWindowsFixedSizeDialogHint = 0x00000100
    MSWindowsOwnDC = 0x00000200
    BypassWindowManagerHint = 0x00000400
    X11BypassWindowManagerHint = BypassWindowManagerHint
    FramelessWindowHint = 0x00000800
    WindowTitleHint = 0x00001000
    WindowSystemMenuHint = 0x00002000
    WindowMinimizeButtonHint = 0x00004000
    WindowMaximizeButtonHint = 0x00008000
    WindowMinMaxButtonsHint = WindowMinimizeButtonHint | WindowMaximizeButtonHint
    WindowContextHelpButtonHint = 0x00010000
    WindowShadeButtonHint = 0x00020000
    WindowStaysOnTopHint = 0x00040000
    WindowTransparentForInput = 0x00080000
    WindowOverridesSystemGestures = 0x00100000
    WindowDoesNotAcceptFocus = 0x00200000
    MaximizeUsingFullscreenGeometryHint = 0x00400000

    CustomizeWindowHint = 0x02000000
    WindowStaysOnBottomHint = 0x04000000
    WindowCloseButtonHint = 0x08000000
    MacWindowToolBarButtonHint = 0x10000000
    BypassGraphicsProxyWidget = 0x20000000
    NoDropShadowWindowHint = 0x40000000
    WindowFullscreenButtonHint = 0x80000000
end

@enum WindowState begin
    WindowNoState = 0x00000000
    WindowMinimized = 0x00000001
    WindowMaximized = 0x00000002
    WindowFullScreen = 0x00000004
    WindowActive = 0x00000008
end

@enum ApplicationState begin
    ApplicationSuspended = 0x00000000
    ApplicationHidden = 0x00000001
    ApplicationInactive = 0x00000002
    ApplicationActive = 0x00000004
end

@enum ScreenOrientation begin
    PrimaryOrientation = 0x00000000
    PortraitOrientation = 0x00000001
    LandscapeOrientation = 0x00000002
    InvertedPortraitOrientation = 0x00000004
    InvertedLandscapeOrientation = 0x00000008
end