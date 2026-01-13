# Neovim 플러그인 설정 가이드

> kickstart.nvim 기반 Neovim 설정에 유용한 플러그인들을 추가하는 방법을 안내합니다.
> 각 플러그인은 독립적으로 추가할 수 있으며, 필요한 기능만 선택하여 설치하세요.

---

## 목차

1. [생산성 향상](#1-생산성-향상)
   - [flash.nvim - 빠른 이동](#11-flashnvim---빠른-이동)
   - [harpoon - 파일 즐겨찾기](#12-harpoon---파일-즐겨찾기)
   - [nvim-surround - 텍스트 감싸기](#13-nvim-surround---텍스트-감싸기)
   - [yanky.nvim - 클립보드 히스토리](#14-yankynvim---클립보드-히스토리)
2. [Git 통합](#2-git-통합)
   - [lazygit.nvim - Git TUI](#21-lazygitnvim---git-tui)
   - [diffview.nvim - Diff 뷰어](#22-diffviewnvim---diff-뷰어)
3. [코드 구조](#3-코드-구조)
   - [aerial.nvim - 코드 아웃라인](#31-aerialnvim---코드-아웃라인)
   - [trouble.nvim - 진단 목록](#32-troublenvim---진단-목록)
   - [nvim-ufo - 코드 폴딩](#33-nvim-ufo---코드-폴딩)
4. [UI 개선](#4-ui-개선)
   - [noice.nvim - UI 현대화](#41-noicenvim---ui-현대화)
   - [bufferline.nvim - 버퍼 탭](#42-bufferlinenvim---버퍼-탭)
   - [zen-mode + twilight - 집중 모드](#43-zen-mode--twilight---집중-모드)
5. [개발 도구](#5-개발-도구)
   - [toggleterm.nvim - 터미널](#51-toggletermnvim---터미널)
   - [vim-dadbod - 데이터베이스](#52-vim-dadbod---데이터베이스)
   - [rest.nvim - REST API 클라이언트](#53-restnvim---rest-api-클라이언트)
6. [기타](#6-기타)
   - [todo-comments.nvim - TODO 하이라이트](#61-todo-commentsnvim---todo-하이라이트)
   - [markdown-preview.nvim - 마크다운 미리보기](#62-markdown-previewnvim---마크다운-미리보기)

---

## 시작하기 전에

### lazy.nvim 플러그인 추가 방법

kickstart.nvim은 `lazy.nvim`을 패키지 매니저로 사용합니다. 플러그인을 추가하려면 `init.lua`의 `require('lazy').setup({...})` 블록 안에 플러그인 설정을 추가하세요.

```lua
require('lazy').setup({
  -- 기존 플러그인들...

  -- 여기에 새 플러그인 추가
  {
    'plugin-author/plugin-name',
    opts = {},
  },
})
```

### which-key 그룹 추가 방법

키맵 그룹을 추가하려면 which-key 설정의 `spec`에 추가합니다:

```lua
{ -- which-key 설정 부분
  'folke/which-key.nvim',
  opts = {
    spec = {
      -- 기존 그룹들...
      { '<leader>새키', group = '[그]룹명', icon = '아이콘' },
    },
  },
},
```

---

## 1. 생산성 향상

### 1.1 flash.nvim - 빠른 이동

화면에 보이는 어떤 위치로든 2-3번의 키 입력으로 이동할 수 있습니다.

#### 설치

```lua
{
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `s` | 점프 모드 시작 → 이동할 위치의 문자 입력 → 라벨 선택 |
| `S` | Treesitter 기반 코드 블록 선택 |

```
예시:
1. s 입력
2. 이동하려는 위치의 첫 글자 입력 (예: "f")
3. 화면에 라벨(a, b, c...) 표시됨
4. 원하는 위치의 라벨 입력하면 즉시 이동
```

---

### 1.2 harpoon - 파일 즐겨찾기

자주 사용하는 파일을 등록하고 단축키로 빠르게 전환합니다.

#### 설치

```lua
{
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = 'Add file' })
    vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Menu' })

    vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end, { desc = 'File 1' })
    vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end, { desc = 'File 2' })
    vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end, { desc = 'File 3' })
    vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end, { desc = 'File 4' })
  end,
},
```

#### which-key 그룹 추가

```lua
{ '<leader>h', group = '[H]arpoon', icon = '󰛢' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>ha` | 현재 파일을 목록에 추가 |
| `<Space>hm` | Harpoon 메뉴 열기 |
| `<Space>h1~4` | 1~4번 파일로 바로 이동 |

---

### 1.3 nvim-surround - 텍스트 감싸기

텍스트를 괄호, 따옴표 등으로 감싸거나 변경합니다.

#### 설치

```lua
{
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  opts = {},
},
```

#### 사용법

| 키 | 설명 | 예시 |
|----|------|------|
| `ys{motion}{char}` | 감싸기 | `ysiw"` → hello → "hello" |
| `ds{char}` | 제거 | `ds"` → "hello" → hello |
| `cs{old}{new}` | 변경 | `cs"'` → "hello" → 'hello' |

```
Visual 모드에서:
1. 텍스트 선택
2. S" 입력
3. 선택된 텍스트가 "로 감싸짐
```

---

### 1.4 yanky.nvim - 클립보드 히스토리

복사한 내용의 히스토리를 관리하고 이전에 복사한 내용을 다시 붙여넣습니다.

#### 의존성 설치

```bash
# Ubuntu
sudo apt install sqlite3 libsqlite3-dev

# Arch Linux
sudo pacman -S sqlite
```

#### 설치

```lua
{
  'gbprod/yanky.nvim',
  dependencies = { 'kkharji/sqlite.lua' },
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put after' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put before' },
    { '<C-p>', '<Plug>(YankyPreviousEntry)', desc = 'Previous yank' },
    { '<C-n>', '<Plug>(YankyNextEntry)', desc = 'Next yank' },
    { '<leader>y', '<cmd>YankyRingHistory<cr>', desc = '[Y]ank history' },
  },
  opts = {
    ring = {
      history_length = 100,
      storage = 'sqlite',
      sync_with_numbered_registers = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 200,
    },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `p` / `P` | 붙여넣기 (기존과 동일) |
| `<C-p>` | 붙여넣기 후, 이전 yank 내용으로 교체 |
| `<C-n>` | 붙여넣기 후, 다음 yank 내용으로 교체 |
| `<Space>y` | Yank 히스토리 목록 열기 |

```
사용 예시:
1. 여러 텍스트를 순서대로 복사 (A, B, C)
2. p로 붙여넣기 → C가 붙여짐
3. <C-p> 입력 → B로 변경됨
4. <C-p> 입력 → A로 변경됨
```

---

## 2. Git 통합

### 2.1 lazygit.nvim - Git TUI

Neovim 안에서 lazygit을 실행합니다.

#### 의존성 설치

```bash
# Ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Arch Linux
sudo pacman -S lazygit
```

#### 설치

```lua
{
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    { '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit Current File' },
  },
},
```

#### which-key 그룹 추가

```lua
{ '<leader>g', group = '[G]it', icon = '' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>gg` | LazyGit 열기 |
| `<Space>gf` | 현재 파일의 LazyGit 열기 |

LazyGit 내부 키맵:
- `space` - 파일 스테이지/언스테이지
- `c` - 커밋
- `p` - 푸시
- `q` - 종료

---

### 2.2 diffview.nvim - Diff 뷰어

Git diff를 보기 좋게 표시합니다.

#### 설치

```lua
{
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Branch History' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Diffview Close' },
  },
  opts = {
    keymaps = {
      view = { { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } } },
      file_panel = { { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } } },
      file_history_panel = { { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } } },
    },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>gd` | 현재 변경사항 diff 보기 |
| `<Space>gh` | 현재 파일 히스토리 |
| `<Space>gH` | 브랜치 전체 히스토리 |
| `<Space>gc` | Diffview 닫기 |

---

## 3. 코드 구조

### 3.1 aerial.nvim - 코드 아웃라인

파일 내 함수, 클래스 등의 구조를 사이드바로 보여줍니다.

#### 설치

```lua
{
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>a', '<cmd>AerialToggle!<cr>', desc = '[A]erial (Code Outline)' },
  },
  opts = {
    layout = {
      min_width = 30,
      default_direction = 'right',
    },
    attach_mode = 'global',
    backends = { 'treesitter', 'lsp', 'markdown', 'man' },
    show_guides = true,
    filter_kind = false,
    keymaps = {
      ['q'] = 'actions.close',
      ['<CR>'] = 'actions.jump',
      ['<C-v>'] = 'actions.jump_vsplit',
      ['<C-s>'] = 'actions.jump_split',
      ['{'] = 'actions.prev',
      ['}'] = 'actions.next',
    },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>a` | Aerial 토글 |

Aerial 내부:
- `Enter` - 해당 심볼로 이동
- `{` / `}` - 이전/다음 심볼
- `q` - 닫기

---

### 3.2 trouble.nvim - 진단 목록

에러, 경고, 참조 등을 보기 좋은 목록으로 보여줍니다.

#### 설치

```lua
{
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'Trouble' },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics' },
    { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    { '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions/References' },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List' },
  },
  opts = {},
},
```

#### which-key 그룹 추가

```lua
{ '<leader>x', group = '[X] Trouble', icon = '' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>xx` | 전체 프로젝트 진단 |
| `<Space>xX` | 현재 버퍼 진단 |
| `<Space>xs` | 심볼 목록 |
| `<Space>xl` | LSP 정의/참조 |

---

### 3.3 nvim-ufo - 코드 폴딩

Treesitter 기반의 향상된 코드 폴딩입니다.

#### 설치

```lua
{
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    { 'zr', function() require('ufo').openFoldsExceptKinds() end, desc = 'Open folds except kinds' },
    { 'zm', function() require('ufo').closeFoldsWith() end, desc = 'Close folds with' },
    { 'zK', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, desc = 'Peek folded lines' },
  },
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end,
    open_fold_hl_timeout = 150,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d lines'):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end,
  },
  init = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `zR` | 모든 폴드 열기 |
| `zM` | 모든 폴드 닫기 |
| `zo` / `zc` | 현재 폴드 열기/닫기 |
| `za` | 현재 폴드 토글 |
| `zK` | 접힌 내용 미리보기 |

```
접힌 상태 표시:
public class UserService { ··· 25 lines ···
```

---

## 4. UI 개선

### 4.1 noice.nvim - UI 현대화

명령줄, 메시지, 알림 UI를 현대적으로 개선합니다.

#### 설치

```lua
{
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
},
```

설치 후 자동으로 적용됩니다. 별도 키맵 없음.

---

### 4.2 bufferline.nvim - 버퍼 탭

열린 파일들을 상단에 탭처럼 표시합니다.

#### 설치

```lua
{
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bd', '<cmd>bdelete<cr>', desc = '[B]uffer [D]elete (Close)' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = '[B]uffer [P]in' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', desc = '[B]uffer Close Un[P]inned' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = '[B]uffer Close [O]thers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = '[B]uffer Close [R]ight' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = '[B]uffer Close [L]eft' },
    { '<leader>b1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = '[B]uffer 1' },
    { '<leader>b2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = '[B]uffer 2' },
    { '<leader>b3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = '[B]uffer 3' },
    { '<leader>b4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = '[B]uffer 4' },
    { '<leader>b5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = '[B]uffer 5' },
  },
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'thin',
      show_buffer_close_icons = true,
      show_close_icon = false,
      color_icons = true,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level)
        local icon = level:match('error') and ' ' or ' '
        return ' ' .. icon .. count
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          separator = true,
        },
      },
    },
  },
},
```

#### which-key 그룹 추가

```lua
{ '<leader>b', group = '[B]uffer', icon = '' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `Shift+h` / `Shift+l` | 이전/다음 버퍼 |
| `<Space>bd` | 현재 버퍼 닫기 |
| `<Space>bp` | 버퍼 고정 (Pin) |
| `<Space>bo` | 다른 버퍼 모두 닫기 |
| `<Space>b1~5` | 1~5번 버퍼로 이동 |

---

### 4.3 zen-mode + twilight - 집중 모드

방해 요소를 제거하고 코드에만 집중합니다.

#### 설치

```lua
-- zen-mode
{
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = '[Z]en Mode' },
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = '0',
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
  },
},

-- twilight
{
  'folke/twilight.nvim',
  cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
  keys = {
    { '<leader>tw', '<cmd>Twilight<cr>', desc = '[T]oggle T[w]ilight' },
  },
  opts = {
    dimming = {
      alpha = 0.25,
      color = { 'Normal', '#ffffff' },
      term_bg = '#000000',
      inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = { 'function', 'method', 'table', 'if_statement' },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>z` | Zen Mode 토글 (모든 UI 숨김) |
| `<Space>tw` | Twilight 토글 (주변 코드 어둡게) |

---

## 5. 개발 도구

### 5.1 toggleterm.nvim - 터미널

Neovim 내에서 터미널을 편리하게 관리합니다.

#### 설치

```lua
{
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-\\>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]erminal [F]loat' },
    { '<leader>t-', '<cmd>ToggleTerm direction=horizontal size=15<cr>', desc = '[T]erminal Horizontal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<cr>', desc = '[T]erminal [V]ertical' },
    { '<leader>tg', function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
          cmd = 'lazygit',
          dir = 'git_dir',
          direction = 'float',
          float_opts = { border = 'curved' },
          on_open = function(term)
            vim.cmd('startinsert!')
          end,
        })
        lazygit:toggle()
      end, desc = '[T]erminal lazy[G]it' },
  },
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    direction = 'float',
    close_on_exit = true,
    float_opts = { border = 'curved' },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `Ctrl+\` | 터미널 토글 (플로팅) |
| `<Space>tf` | 플로팅 터미널 |
| `<Space>t-` | 하단 수평 터미널 |
| `<Space>tv` | 우측 수직 터미널 |
| `<Space>tg` | LazyGit 터미널 |

---

### 5.2 vim-dadbod - 데이터베이스

Neovim 내에서 데이터베이스에 연결하고 쿼리를 실행합니다.

#### 의존성 설치

```bash
# 연결하려는 DB의 클라이언트 설치

# Ubuntu - MySQL
sudo apt install mysql-client

# Ubuntu - PostgreSQL
sudo apt install postgresql-client

# Arch Linux - MySQL
sudo pacman -S mariadb-clients

# Arch Linux - PostgreSQL
sudo pacman -S postgresql
```

#### 설치

```lua
{
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
  keys = {
    { '<leader>Db', '<cmd>DBUIToggle<cr>', desc = '[D]ata[B]ase UI' },
    { '<leader>Da', '<cmd>DBUIAddConnection<cr>', desc = '[D]B [A]dd Connection' },
    { '<leader>Df', '<cmd>DBUIFindBuffer<cr>', desc = '[D]B [F]ind Buffer' },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_win_position = 'left'
    vim.g.db_ui_winwidth = 40

    vim.g.db_ui_table_helpers = {
      mysql = {
        Count = 'SELECT COUNT(*) FROM {table}',
        List = 'SELECT * FROM {table} LIMIT 100',
      },
      postgresql = {
        Count = 'SELECT COUNT(*) FROM {table}',
        List = 'SELECT * FROM {table} LIMIT 100',
      },
    }
  end,
},
```

#### which-key 그룹 추가

```lua
{ '<leader>D', group = '[D]atabase', icon = '' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>Db` | Database UI 열기/닫기 |
| `<Space>Da` | 연결 추가 |
| `S` | 쿼리 실행 (SQL 버퍼에서) |

연결 문자열 형식:
```
MySQL:      mysql://user:password@localhost:3306/dbname
PostgreSQL: postgresql://user:password@localhost:5432/dbname
SQLite:     sqlite:./path/to/db.sqlite
```

---

### 5.3 rest.nvim - REST API 클라이언트

Neovim 내에서 HTTP 요청을 보내고 응답을 확인합니다.

#### 의존성 설치

```bash
# Ubuntu
sudo apt install jq luarocks libreadline-dev

# Arch Linux
sudo pacman -S jq luarocks readline
```

#### 설치

```lua
{
  'rest-nvim/rest.nvim',
  ft = 'http',
  keys = {
    { '<leader>Rr', '<cmd>Rest run<cr>', desc = '[R]EST [R]un request' },
    { '<leader>Rl', '<cmd>Rest run last<cr>', desc = '[R]EST Run [L]ast' },
  },
  config = function()
    require('rest-nvim').setup({
      result = {
        split = {
          horizontal = false,
          in_place = false,
        },
        behavior = {
          formatters = {
            json = 'jq',
            html = function(body)
              return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
            end,
          },
        },
      },
    })
  end,
},
```

#### which-key 그룹 추가

```lua
{ '<leader>R', group = '[R]EST API', icon = '' },
```

#### 사용법

`.http` 파일을 만들고 요청을 작성합니다:

```http
### 사용자 목록 조회
GET http://localhost:8080/api/users
Content-Type: application/json

### 사용자 생성
POST http://localhost:8080/api/users
Content-Type: application/json

{
  "name": "Kim",
  "email": "kim@example.com"
}
```

| 키 | 설명 |
|----|------|
| `<Space>Rr` | 현재 요청 실행 |
| `<Space>Rl` | 마지막 요청 다시 실행 |

---

## 6. 기타

### 6.1 todo-comments.nvim - TODO 하이라이트

코드 내 TODO, FIXME, HACK 등을 하이라이트하고 검색합니다.

#### 설치

```lua
{
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { ']t', function() require('todo-comments').jump_next() end, desc = 'Next TODO' },
    { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous TODO' },
    { '<leader>st', '<cmd>TodoTelescope<cr>', desc = '[S]earch [T]ODO' },
  },
  opts = {
    signs = true,
    keywords = {
      FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },
  },
},
```

#### 사용법

| 키 | 설명 |
|----|------|
| `]t` | 다음 TODO로 이동 |
| `[t` | 이전 TODO로 이동 |
| `<Space>st` | 프로젝트 전체 TODO 검색 |

지원 키워드: `TODO`, `FIXME`, `BUG`, `HACK`, `WARN`, `PERF`, `NOTE`

---

### 6.2 markdown-preview.nvim - 마크다운 미리보기

마크다운 파일을 브라우저에서 실시간 미리보기합니다.

#### 설치

```lua
{
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = 'cd app && npm install',
  keys = {
    { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = '[M]arkdown [P]review' },
  },
},
```

#### which-key 그룹 추가

```lua
{ '<leader>m', group = '[M]arkdown', icon = '' },
```

#### 사용법

| 키 | 설명 |
|----|------|
| `<Space>mp` | 마크다운 미리보기 토글 |

```
1. 마크다운 파일 열기
2. <Space>mp 입력
3. 브라우저가 열리며 실시간 미리보기
4. 파일 수정 시 브라우저도 자동 갱신
5. 다시 <Space>mp로 종료
```

---

## 마무리

### 플러그인 설치 후 확인

Neovim을 재시작하면 lazy.nvim이 자동으로 플러그인을 설치합니다.

```vim
:Lazy          " 플러그인 상태 확인
:Lazy sync     " 플러그인 동기화
:Lazy update   " 플러그인 업데이트
:checkhealth   " 문제 진단
```

### 도움이 필요하면

- `:help {plugin-name}` - 플러그인 도움말
- `<Space>sk` - 키맵 검색
- `<Space>sh` - 도움말 검색

---

*이 가이드는 kickstart.nvim 기반 설정을 위해 작성되었습니다.*
