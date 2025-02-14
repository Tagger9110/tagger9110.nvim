-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- return {
--   'nvim-neo-tree/neo-tree.nvim',
--   version = '*',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--     'MunifTanjim/nui.nvim',
--   },
--   cmd = 'Neotree',
--   keys = {
--     { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
--   },
--   opts = {
--     filesystem = {
--       window = {
--         mappings = {
--           ['\\'] = 'close_window',
--         },
--       },
--     },
--   },
-- }
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim', -- lua 함수들을 모아둔 플러그인
    'nvim-tree/nvim-web-devicons', -- 파일 아이콘
    'MunifTanjim/nui.nvim', -- UI 컴포넌트 라이브러리
  },
  config = function()
    require('neo-tree').setup {
      -- 마지막 창이 neo-tree일 경우 neovim을 종료
      close_if_last_window = true,
      -- git 상태 표시 활성화 (modified, staged, untracked 등)
      enable_git_status = true,
      -- diagnostic 표시 활성화 (LSP 에러, 경고 등)
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          -- 필터된 항목 표시 여부
          visible = false,
          -- dot으로 시작하는 파일 숨김 여부 (.git 등)
          hide_dotfiles = false,
          -- .gitignore에 있는 파일 숨김 여부
          hide_gitignored = false,
        },
        -- 현재 편집 중인 파일을 자동으로 찾아서 표시
        follow_current_file = {
          enable = true,
        },
        -- netrw 대체 동작 설정
        -- "open_default" | "open_current" | "disabled"
        hijack_netrw_behavior = 'open_current',
      },
      window = {
        -- 창 너비
        width = 40,
        -- 창 위치 ("left" | "right")
        position = 'left',
        -- 창 매핑
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      -- 기본 키매핑 활성화 여부
      default_component_configs = {
        indent = {
          -- 들여쓰기 표시 방법
          indent_marker = '│',
          last_indent_marker = '└',
          indent_size = 2,
        },
        icon = {
          -- 폴더와 파일 아이콘 표시
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
        },
        modified = {
          -- 수정된 파일 표시
          symbol = '[+]',
        },
        git_status = {
          -- git 상태 심볼 설정
          symbols = {
            added = '✚',
            modified = '',
            deleted = '✖',
            renamed = '',
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
      },
    }
    -- 키매핑 설정
    -- <leader>e로 neo-tree 토글
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
    -- <leader>o로 neo-tree에 포커스
    vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Neo-tree' })
  end,
}
-- 파일 탐색기에서 사용 가능한 기본 키매핑
-- a: 새 파일/폴더 생성
-- d: 파일/폴더 삭제
-- r: 이름 변경
-- y: 경로 복사
-- x: 자르기
-- p: 붙여넣기
-- c: 복사
-- s: 시스템 파일 관리자로 열기
-- /: 파일 검색
-- H: 숨김 파일 토글
-- E: 확장 모드 토글
-- W: 너비 조절 모드 진입
-- [g: 이전 git 수정된 파일로 이동
-- ]g: 다음 git 수정된 파일로 이동
-- .: 명령어 팔레트 호출
