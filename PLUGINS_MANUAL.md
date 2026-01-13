# Neovim 플러그인 매뉴얼

---

# 1. 생산성 향상

## 1.1 autopairs (nvim-autopairs)

괄호, 따옴표 등을 자동으로 닫아주는 플러그인

### 사용법

| 입력 | 결과 |
|------|------|
| `(` | `()` 커서는 중간에 |
| `{` | `{}` |
| `[` | `[]` |
| `'` | `''` |
| `"` | `""` |
| `` ` `` | ``` `` ``` |

### 특징
- 자동완성(nvim-cmp)과 연동됨
- 함수 자동완성 후 `(` 자동 추가

---

## 1.2 nvim-ts-autotag

HTML, Vue, JSX 등에서 태그를 자동으로 닫아주는 플러그인

### 사용법

| 입력 | 결과 |
|------|------|
| `<div>` | `<div></div>` 커서는 중간에 |
| `<template>` | `<template></template>` |
| `<MyComponent>` | `<MyComponent></MyComponent>` |

### 특징
- 여는 태그 이름 수정 시 닫는 태그도 자동 수정
- Vue, React, HTML 모두 지원

---

## 1.3 flash.nvim

화면 내 원하는 위치로 빠르게 이동하는 플러그인

### 키맵

| 키 | 모드 | 설명 |
|----|------|------|
| `s` | Normal, Visual, Operator | Flash 점프 |
| `S` | Normal, Visual, Operator | Treesitter 기반 선택 |
| `r` | Operator | 원격 Flash (operator 대기 중 사용) |
| `R` | Operator, Visual | Treesitter 검색 |

### 사용 예시

1. **기본 점프 (`s`)**
   - `s` 누르고 이동할 위치의 문자 입력
   - 화면에 라벨이 표시됨
   - 라벨 문자 입력하면 해당 위치로 이동

2. **Treesitter 선택 (`S`)**
   - `S` 누르면 코드 블록 단위로 선택 가능
   - 함수, 조건문, 클래스 등 구조 단위 선택

3. **Operator와 함께 사용**
   - `ds` → Flash로 이동한 위치까지 삭제
   - `ys` → Flash로 이동한 위치까지 복사
   - `cs` → Flash로 이동한 위치까지 변경

---

## 1.4 harpoon

자주 사용하는 파일을 즐겨찾기에 등록하고 빠르게 전환하는 플러그인

### 키맵 (`<Space>h`)

| 키 | 설명 |
|----|------|
| `<leader>ha` | 현재 파일을 Harpoon 목록에 추가 |
| `<leader>hm` | Harpoon 메뉴 열기/닫기 |
| `<leader>h1` | 1번 파일로 이동 |
| `<leader>h2` | 2번 파일로 이동 |
| `<leader>h3` | 3번 파일로 이동 |
| `<leader>h4` | 4번 파일로 이동 |

### 사용 시나리오

1. **파일 등록** - `<Space>ha`로 Harpoon 목록에 추가
2. **파일 전환** - `<Space>h1` ~ `<Space>h4`로 즉시 전환
3. **목록 관리** - `<Space>hm`으로 메뉴 열기, `dd`로 제거

---

# 2. Git 작업

모든 Git 관련 키맵은 `<Space>g` 그룹에 있습니다.

## 2.1 gitsigns.nvim

Git 변경사항을 gutter에 표시하고, hunk 단위로 관리하는 플러그인

### Hunk 탐색

| 키 | 설명 |
|----|------|
| `]c` | 다음 변경 블록(hunk)으로 이동 |
| `[c` | 이전 변경 블록(hunk)으로 이동 |

### Hunk 관리 (`<Space>g`)

| 키 | 설명 |
|----|------|
| `<leader>gs` | Hunk 스테이징 |
| `<leader>gr` | Hunk 되돌리기 (reset) |
| `<leader>gS` | 버퍼 전체 스테이징 |
| `<leader>gR` | 버퍼 전체 되돌리기 |
| `<leader>gu` | 스테이징 취소 (undo) |
| `<leader>gp` | Hunk 미리보기 |
| `<leader>gb` | 현재 줄 blame 보기 |
| `<leader>gD` | 마지막 커밋과 diff |

### 토글 (`<Space>t`)

| 키 | 설명 |
|----|------|
| `<leader>tb` | 줄별 blame 표시 토글 |
| `<leader>tD` | 삭제된 줄 표시 토글 |

---

## 2.2 lazygit.nvim

neovim 안에서 lazygit TUI를 실행하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>gg` | LazyGit 열기 |
| `<leader>gf` | 현재 파일의 LazyGit 열기 |

### 주요 LazyGit 키맵 (LazyGit 내부)

| 키 | 설명 |
|----|------|
| `space` | 파일 스테이징/언스테이징 |
| `c` | 커밋 |
| `p` | 푸시 |
| `P` | 풀 |
| `b` | 브랜치 메뉴 |
| `q` | 종료 |
| `?` | 도움말 |

**참고:** 시스템에 `lazygit`이 설치되어 있어야 합니다.

---

## 2.3 diffview.nvim

Git diff를 보기 좋게 표시하는 플러그인

### 키맵

| 키 | 설명 |
|----|------|
| `<leader>gd` | Diffview 열기 (현재 변경사항) |
| `<leader>gh` | 현재 파일 히스토리 |
| `<leader>gH` | 브랜치 전체 히스토리 |
| `<leader>gc` | Diffview 닫기 |

### Diffview 내부 키맵

| 키 | 설명 |
|----|------|
| `<Tab>` | 다음 파일 |
| `<S-Tab>` | 이전 파일 |
| `]x` | 다음 충돌 |
| `[x` | 이전 충돌 |
| `q` | 닫기 |

---

# 3. 요약 치트시트

```
[생산성]
autopairs      : 자동 - 괄호/따옴표 입력 시 자동 닫기
nvim-ts-autotag: 자동 - HTML/Vue 태그 자동 닫기
flash.nvim     : s / S - 빠른 점프 / Treesitter 선택
harpoon        : <Space>ha  - 파일 추가
                 <Space>hm  - 메뉴 열기
                 <Space>h1~4 - 파일 전환

[Git]
gitsigns       : ]c / [c    - 다음/이전 hunk 이동
                 <Space>gs  - hunk 스테이징
                 <Space>gr  - hunk 되돌리기
                 <Space>gp  - hunk 미리보기
                 <Space>gb  - blame 보기
lazygit        : <Space>gg  - LazyGit 열기
diffview       : <Space>gd  - diff 보기
                 <Space>gh  - 파일 히스토리
                 <Space>gc  - 닫기
```
