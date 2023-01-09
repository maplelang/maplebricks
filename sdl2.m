//
// (Hackish, incomplete) SDL2 bindings for Maple
// This is enough to compile the "bricks" example game
// Copyright (C) Mate Kukri, 2023
//

const SDL_INIT_TIMER          : Uint32 = 0x00000001
const SDL_INIT_AUDIO          : Uint32 = 0x00000010
const SDL_INIT_VIDEO          : Uint32 = 0x00000020
const SDL_INIT_JOYSTICK       : Uint32 = 0x00000200
const SDL_INIT_HAPTIC         : Uint32 = 0x00001000
const SDL_INIT_GAMECONTROLLER : Uint32 = 0x00002000
const SDL_INIT_EVENTS         : Uint32 = 0x00004000
const SDL_INIT_SENSOR         : Uint32 = 0x00008000
const SDL_INIT_NOPARACHUTE    : Uint32 = 0x00100000

// FIXME: these should be relative paths
// but currently path resolution is buggy
const SDL_INIT_EVERYTHING     : Uint32 =
  sdl2::SDL_INIT_TIMER |
  sdl2::SDL_INIT_AUDIO |
  sdl2::SDL_INIT_VIDEO |
  sdl2::SDL_INIT_EVENTS |
  sdl2::SDL_INIT_JOYSTICK |
  sdl2::SDL_INIT_HAPTIC |
  sdl2::SDL_INIT_GAMECONTROLLER |
  sdl2::SDL_INIT_SENSOR

const SDL_WINDOWPOS_CENTERED  : Uint32 = 0x2fff0000

const IMG_INIT_JPG            : Int32 = 0x00000001
const IMG_INIT_PNG            : Int32 = 0x00000002
const IMG_INIT_TIF            : Int32 = 0x00000004
const IMG_INIT_WEBP           : Int32 = 0x00000008

struct SDL_Window()
struct SDL_Renderer()
struct SDL_Texture()

struct SDL_Rect (
  x: Int32,
  y: Int32,
  w: Int32,
  h: Int32
)

const SDL_QUIT                : Int32 = 0x100
const SDL_KEYDOWN             : Int32 = 0x300
const SDL_KEYUP               : Int32 = 0x301

const SDL_SCANCODE_RIGHT      : Int32 = 79
const SDL_SCANCODE_LEFT       : Int32 = 80
const SDL_SCANCODE_DOWN       : Int32 = 81
const SDL_SCANCODE_UP         : Int32 = 82

union SDL_Event (
  type: Uint32,
  key: sdl2::SDL_KeyboardEvent,
  padding: [56]Uint8
)

struct SDL_KeyboardEvent (
  type      : Uint32,
  timestamp : Uint32,
  windowID  : Uint32,
  state     : Uint8,
  repeat    : Uint8,
  padding2  : Uint8,
  padding3  : Uint8,
  keysym    : sdl2::SDL_Keysym
)

struct SDL_Keysym (
  scancode  : Int32,
  sym       : Int32,
  mod       : Uint16,
  unused    : Uint32
)

extern {
  function SDL_Init(flags: Uint32) -> Int32
  function SDL_Quit()
  function SDL_GetError() -> *Int8

  function SDL_CreateWindow(title: *Int8,
                            x: Int32,
                            y: Int32,
                            w: Int32,
                            h: Int32,
                            flags: Uint32) -> *mut sdl2::SDL_Window

  function SDL_DestroyWindow(window: *mut sdl2::SDL_Window)

  function SDL_CreateRenderer(window: *mut sdl2::SDL_Window,
                              index: Int32,
                              flags: Uint32) -> *mut sdl2::SDL_Renderer

  function SDL_DestroyRenderer(renderer: *mut sdl2::SDL_Renderer)

  function SDL_GetTicks() -> Uint32
  function SDL_PollEvent(event: *mut sdl2::SDL_Event) -> Int32

  function SDL_SetRenderDrawColor(renderer: *mut sdl2::SDL_Renderer,
                                  r: Uint8,
                                  g: Uint8,
                                  b: Uint8,
                                  a: Uint8) -> Int32

  function SDL_SetTextureColorMod(texture: *mut sdl2::SDL_Texture,
                                  r: Uint8,
                                  g: Uint8,
                                  b: Uint8) -> Int32

  function SDL_RenderClear(renderer: *mut sdl2::SDL_Renderer) -> Int32
  function SDL_RenderCopy(renderer: *mut sdl2::SDL_Renderer,
                          texture: *mut sdl2::SDL_Texture,
                          srcrect: *sdl2::SDL_Rect,
                          dstrect: *sdl2::SDL_Rect) -> Int32

  function SDL_RenderPresent(renderer: *mut sdl2::SDL_Renderer)

  function IMG_Init(flags: Int32) -> Int32
  function IMG_Quit()

  function IMG_LoadTexture(renderer: *mut sdl2::SDL_Renderer,
                            file: *Int8) -> *mut sdl2::SDL_Texture
}
