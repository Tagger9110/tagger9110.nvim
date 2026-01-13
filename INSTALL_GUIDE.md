# Neovim 플러그인 의존성 설치 가이드

이 문서는 Neovim 플러그인들이 정상 작동하기 위해 필요한 외부 프로그램들의 설치 방법을 안내합니다.

---

## 필수 설치 항목

### 1. 기본 도구

| 프로그램 | 용도 | 사용 플러그인 |
|----------|------|---------------|
| `git` | 버전 관리 | gitsigns, lazygit, diffview |
| `ripgrep` (rg) | 빠른 텍스트 검색 | Telescope, todo-comments |
| `fd` | 빠른 파일 검색 | Telescope |
| `gcc` / `clang` | Treesitter 파서 컴파일 | nvim-treesitter |
| `make` | 빌드 도구 | telescope-fzf-native |
| `npm` / `node` | JavaScript 런타임 | markdown-preview, LSP 서버 |

#### Ubuntu / Debian
```bash
sudo apt update
sudo apt install git ripgrep fd-find gcc make nodejs npm
# fd-find는 fdfind로 실행됨, fd로 심볼릭 링크 생성
sudo ln -sf $(which fdfind) /usr/local/bin/fd
```

#### Arch Linux
```bash
sudo pacman -S git ripgrep fd gcc make nodejs npm
```

---

### 2. Git 관련

| 프로그램 | 용도 | 사용 플러그인 |
|----------|------|---------------|
| `lazygit` | Git TUI 클라이언트 | lazygit.nvim, toggleterm |

#### Ubuntu / Debian
```bash
# lazygit 최신 버전 설치
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz
```

#### Arch Linux
```bash
sudo pacman -S lazygit
```

---

### 3. REST API 클라이언트

| 프로그램 | 용도 | 사용 플러그인 |
|----------|------|---------------|
| `jq` | JSON 포맷팅 | rest.nvim |
| `luarocks` | Lua 패키지 관리자 | rest.nvim |
| `libreadline-dev` | luarocks 빌드 | rest.nvim |

#### Ubuntu / Debian
```bash
sudo apt install jq luarocks libreadline-dev
```

#### Arch Linux
```bash
sudo pacman -S jq luarocks readline
```

---

### 4. Yank 히스토리 (SQLite)

| 프로그램 | 용도 | 사용 플러그인 |
|----------|------|---------------|
| `sqlite3` | 데이터베이스 | yanky.nvim |

#### Ubuntu / Debian
```bash
sudo apt install sqlite3 libsqlite3-dev
```

#### Arch Linux
```bash
sudo pacman -S sqlite
```

---

### 5. 마크다운 미리보기

| 프로그램 | 용도 | 사용 플러그인 |
|----------|------|---------------|
| `npm` | 패키지 설치 | markdown-preview.nvim |

npm은 기본 도구에서 이미 설치됨.

---

## 선택 설치 항목

### 데이터베이스 클라이언트

vim-dadbod 사용 시 연결하려는 데이터베이스의 클라이언트가 필요합니다.

| 프로그램 | 데이터베이스 |
|----------|--------------|
| `mysql-client` | MySQL / MariaDB |
| `postgresql-client` | PostgreSQL |
| `sqlite3` | SQLite |

#### Ubuntu / Debian
```bash
# MySQL
sudo apt install mysql-client
# 또는 MariaDB
sudo apt install mariadb-client

# PostgreSQL
sudo apt install postgresql-client

# SQLite (위에서 이미 설치)
sudo apt install sqlite3
```

#### Arch Linux
```bash
# MySQL/MariaDB
sudo pacman -S mariadb-clients

# PostgreSQL
sudo pacman -S postgresql

# SQLite (위에서 이미 설치)
sudo pacman -S sqlite
```

---

## 전체 설치 스크립트

### Ubuntu / Debian (전체 설치)
```bash
#!/bin/bash
# Neovim 플러그인 의존성 전체 설치

# 기본 도구
sudo apt update
sudo apt install -y git ripgrep fd-find gcc make nodejs npm curl

# fd 심볼릭 링크
sudo ln -sf $(which fdfind) /usr/local/bin/fd

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# REST API (rest.nvim)
sudo apt install -y jq luarocks libreadline-dev

# SQLite (yanky.nvim)
sudo apt install -y sqlite3 libsqlite3-dev

# 데이터베이스 클라이언트 (선택)
# sudo apt install -y mysql-client postgresql-client

echo "설치 완료!"
```

### Arch Linux (전체 설치)
```bash
#!/bin/bash
# Neovim 플러그인 의존성 전체 설치

# 기본 도구
sudo pacman -S --noconfirm git ripgrep fd gcc make nodejs npm

# lazygit
sudo pacman -S --noconfirm lazygit

# REST API (rest.nvim)
sudo pacman -S --noconfirm jq luarocks readline

# SQLite (yanky.nvim)
sudo pacman -S --noconfirm sqlite

# 데이터베이스 클라이언트 (선택)
# sudo pacman -S --noconfirm mariadb-clients postgresql

echo "설치 완료!"
```

---

## 설치 확인

모든 도구가 정상 설치되었는지 확인:

```bash
# 필수 도구 확인
git --version
rg --version
fd --version
gcc --version
make --version
node --version
npm --version

# lazygit 확인
lazygit --version

# REST API 도구 확인
jq --version
luarocks --version

# SQLite 확인
sqlite3 --version
```

---

## 문제 해결

### rest.nvim 설치 실패
```
luaconf.h:275:10: fatal error: readline/readline.h: No such file or directory
```
해결: `libreadline-dev` (Ubuntu) 또는 `readline` (Arch) 설치 후 Neovim 재시작

### yanky.nvim SQLite 오류
해결: `libsqlite3-dev` (Ubuntu) 또는 `sqlite` (Arch) 설치

### Telescope 검색 느림
해결: `ripgrep`과 `fd` 설치 확인

### Treesitter 파서 컴파일 실패
해결: `gcc` 또는 `clang` 설치 확인

---

## Neovim 설치

### Ubuntu / Debian (최신 버전)
```bash
# AppImage 사용 (권장)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

### Arch Linux
```bash
sudo pacman -S neovim
```
